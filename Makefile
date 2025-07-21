NITROKEY_SDK_PY_VERSION ?= v0.3.0
NITROKEY_SDK_PY_CHECKSUM ?= 1d286bd934ea4c49b92e7e50029bb89d6fd737f4d1994c0adde2d27f1d0ae525

NITROKEY_SDK_PY_URL := https://github.com/Nitrokey/nitrokey-sdk-py/archive/refs/tags/$(NITROKEY_SDK_PY_VERSION).tar.gz
NITROKEY_SDK_PY := nitrokey-sdk-py-$(NITROKEY_SDK_PY_VERSION)
NITROKEY_SDK_PY_ARCHIVE := $(NITROKEY_SDK_PY).tar.gz
NITROKEY_SDK_PY_LINK := source/components/software/nitrokey-sdk-py

FMT ?= html

.PHONY: docs
docs: venv
	venv/bin/sphinx-build -j auto -b $(FMT) -D language=en -d build/en/doctrees source dist/en

.PHONY: venv
venv: $(NITROKEY_SDK_PY)
	python -m venv venv
	venv/bin/pip3 install -r requirements.txt
	venv/bin/pip3 install ./$(NITROKEY_SDK_PY)

.PHONY: check-syntax
check-syntax: venv
	venv/bin/rstcheck --config rstcheck.toml --recursive source

.PHONY: check-hyperlinks
check-hyperlinks: venv docs
	venv/bin/linkchecker -f linkcheckerrc dist/en/index.html

.PHONY: pkg
pkg: venv docs
	mv dist/en/_images dist/_images
	rm -rf dist/*/_sources dist/*/_images
	cp redirects/.htaccess dist
	

clean: 
	rm -rf dist build nitrokey-sdk-py* $(NITROKEY_SDK_PY_LINK)

cleaner: clean
	rm -rf venv

$(NITROKEY_SDK_PY): $(NITROKEY_SDK_PY_ARCHIVE)
	mkdir "$@"
	tar --directory "$@" --extract --strip-components 1 --file "$<"
	rm -f $(NITROKEY_SDK_PY_LINK)
	ln -s ../../../$(NITROKEY_SDK_PY)/docs $(NITROKEY_SDK_PY_LINK)

$(NITROKEY_SDK_PY_ARCHIVE):
	curl "$(NITROKEY_SDK_PY_URL)" --location --output "$@"
	echo "$(NITROKEY_SDK_PY_CHECKSUM) $@" | sha256sum -c
