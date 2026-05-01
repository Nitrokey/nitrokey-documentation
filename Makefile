NITROKEY_SDK_PY_VERSION ?= v0.4.1
NITROKEY_SDK_PY_CHECKSUM ?= 3e6410a037c95d14fce1a5021422f510b47d1b2f0a78cf88d07798b9d24974ea
NITROKEY_SDK_PY_URL := https://github.com/Nitrokey/nitrokey-sdk-py/archive/refs/tags/$(NITROKEY_SDK_PY_VERSION).tar.gz
NITROKEY_SDK_PY := nitrokey-sdk-py-$(NITROKEY_SDK_PY_VERSION)
NITROKEY_SDK_PY_ARCHIVE := $(NITROKEY_SDK_PY).tar.gz
NITROKEY_SDK_PY_LINK := source/components/software/nitrokey-sdk-py

FMT ?= html
EDITOR ?= vim
BUILD_LANG = en
ACCEPTED_WORD_LIST = wordlist.txt
CANDIDATE_WORD_LIST = build/$(BUILD_LANG)/spelling/candidates.txt
VIM_SPELLFILE = spellfile.utf-8.add

.PHONY: docs
docs: venv
	venv/bin/sphinx-build -j auto -b $(FMT) -D language=en -d build/$(BUILD_LANG)/doctrees source dist/$(BUILD_LANG)

.PHONY: venv
venv: venv/lib/python*/site-packages/nitrokey/__init__.py
venv/lib/python*/site-packages/nitrokey/__init__.py: $(NITROKEY_SDK_PY)
	python3 -m venv venv
	venv/bin/pip3 install -r requirements.txt
	venv/bin/pip3 install ./$(NITROKEY_SDK_PY)

define CLEAN_WORD_LIST
sort -u $(1) | sed -e '/^[[:space:]][[:space:]]*$$/d' -e '/^#/d'
endef
.PHONY: spell check-spelling
spell: check-spelling
check-spelling: venv
	@# sphinxcontrib-spelling doesn't seem to overwrite its previous .spelling
	@# files (which could be a bug), so clean those up now…
	-find build/$(BUILD_LANG)/spelling -name "*.spelling" -delete

	# building a list of candidate words to add to '$(CANDIDATE_WORD_LIST)'
	venv/bin/sphinx-build -b spelling source build/$(BUILD_LANG)/spelling
	@echo '# lines KEPT in this file will be treated as CORRECT spellings' \
		> $(CANDIDATE_WORD_LIST)
	find . -name "*.spelling" -exec cat {} \; | awk -F '[()]' '{print $$2}' \
		| sort -u >> $(CANDIDATE_WORD_LIST)
	
ifneq ($(SKIP_ADD_SPELLINGS),1)
	@printf '\nEdit the candidate word list to add new spellings now? [y/N] '; \
	read REPLY; \
	if [ -z "$$REPLY" ] || ! echo "$$REPLY" | grep -qi ^y; then \
		printf '\nOK, not updating the word list.\n'; \
		printf "You can run 'make fix-spelling' to fix misspellings in your editor.\n\n"; \
		exit 1; \
	fi
	$(EDITOR) $(CANDIDATE_WORD_LIST)
	
	# cleaning and re-sorting the wordlists…
	$(call CLEAN_WORD_LIST,$(ACCEPTED_WORD_LIST)) > $(ACCEPTED_WORD_LIST).new
	mv $(ACCEPTED_WORD_LIST).new $(ACCEPTED_WORD_LIST)
	$(call CLEAN_WORD_LIST,$(CANDIDATE_WORD_LIST)) > $(CANDIDATE_WORD_LIST).new
	mv $(CANDIDATE_WORD_LIST).new $(CANDIDATE_WORD_LIST)

	@echo
	# showing differences between existing wordlist (left) and candidates (right)…
	# these two files will be merged together if you continue
	@if type sdiff >/dev/null 2>&1; then \
		sdiff --suppress-common-lines $(ACCEPTED_WORD_LIST) $(CANDIDATE_WORD_LIST); \
	else \
		diff -u $(ACCEPTED_WORD_LIST) $(CANDIDATE_WORD_LIST); \
	fi; \
	printf '\nAbout to update '$(ACCEPTED_WORD_LIST)'. Do the above changes look okay? [Y/n] '; \
	read REPLY; \
	if [ -n "$$REPLY" ] && ! echo "$$REPLY" | grep -qi ^y; then \
		printf '\nOK, not updating the word list.\n\n'; \
		printf "You can run 'make fix-spelling' to fix misspellings in your editor.\n\n"; \
		exit 1; \
	fi
	
	@echo
	# updating wordlist with the new spellings…
	cat $(ACCEPTED_WORD_LIST) $(CANDIDATE_WORD_LIST) \
		| $(CLEAN_WORD_LIST) > $(ACCEPTED_WORD_LIST).new
	mv $(ACCEPTED_WORD_LIST).new $(ACCEPTED_WORD_LIST)
endif
	@printf "\nYou can now run 'make fix-spelling' to correct any identified misspellings.\n\n"

.PHONY: fix correct fix-spelling
fix: fix-spelling
correct: fix-spelling
fix-spelling:
	# opening your $$EDITOR to correct spelling in all misspelled files…
	@exec 3</dev/tty || exec 3<&0; \
	find build/$(BUILD_LANG)/spelling -depth -name "*.spelling" | while read misspelled; do \
		dirname=`dirname "$$misspelled" | sed 's|^build/$(BUILD_LANG)/spelling|source|'`; \
		source=`basename "$$misspelled" .spelling`.rst; \
		printf "\nThe file '$$dirname/$$source' contains spelling mistakes.\n"; \
		printf "Press 's' to skip, Ctrl+C to quit, or [Enter] to open in your editor… "; \
		read REPLY <&3; \
		if [ "$$REPLY" = s -o "$$REPLY" = S ]; then continue; fi; \
		if [ "$(EDITOR)" = vim -o "$(EDITOR)" = nvim ]; then \
			patterns=`mktemp fix-spelling.XXXXXX`; \
			awk -F '[()]' '{print $$2}' "$$misspelled" > "$$patterns"; \
			rm $(VIM_SPELLFILE)* 2>/dev/null || true; \
			ln -s $(ACCEPTED_WORD_LIST) $(VIM_SPELLFILE); \
			$(EDITOR) \
				-c 'set spellfile=$(VIM_SPELLFILE)' -c 'silent mkspell $(VIM_SPELLFILE)' \
				-c 'set spelllang=$(BUILD_LANG)' -c 'setlocal spell' \
				-c "let patterns=readfile('$$patterns')" \
				-c "let @/=join(patterns, '\\|')" \
				-c "let &errorformat='%f:%l: %m'" -c "cfile $$misspelled" \
				-c 'set hlsearch' -c copen "$$dirname/$$source" <&3; \
			rm $(VIM_SPELLFILE)* "$$patterns" 2>/dev/null || true; \
		else \
			$(EDITOR) "$$dirname/$$source" "$$misspelled" <&3; \
		fi; \
	done; \
	exec 3<&-

.PHONY: check-syntax
check-syntax: venv
	venv/bin/rstcheck --config rstcheck.toml --recursive source

.PHONY: check-hyperlinks
check-hyperlinks: venv docs
	venv/bin/linkchecker -f linkcheckerrc dist/$(BUILD_LANG)/index.html

.PHONE: check-hyperlinks-nightly
check-hyperlinks-nightly: venv docs
	venv/bin/linkchecker -f linkcheckerrc_nightly dist/$(BUILD_LANG)/index.html

.PHONY: pkg
pkg: venv docs
	mv dist/$(BUILD_LANG)/_images dist/_images
	rm -rf dist/*/_sources dist/*/_images
	cp redirects/.htaccess dist
	
clean: 
	rm -rf dist build nitrokey-sdk-py* $(NITROKEY_SDK_PY_LINK)

cleaner: clean
	rm -rf venv

$(NITROKEY_SDK_PY): $(NITROKEY_SDK_PY_ARCHIVE)
	if [ ! -d "$@" ]; then mkdir "$@"; fi
	tar --directory "$@" --extract --strip-components 1 --file "$<"
	rm -f $(NITROKEY_SDK_PY_LINK)
	ln -s ../../../$(NITROKEY_SDK_PY)/docs $(NITROKEY_SDK_PY_LINK)

$(NITROKEY_SDK_PY_ARCHIVE):
	curl "$(NITROKEY_SDK_PY_URL)" --location --output "$@"
	echo "$(NITROKEY_SDK_PY_CHECKSUM) $@" | sha256sum -c
