NITROKEY_SDK_PY_VERSION ?= v0.2.3
NITROKEY_SDK_PY_CHECKSUM ?= b0547efe0bce6907f831a80297baf5393825037d3996edd6cf9f1ccc796e736e

NITROKEY_SDK_PY_URL := https://github.com/Nitrokey/nitrokey-sdk-py/archive/refs/tags/$(NITROKEY_SDK_PY_VERSION).tar.gz
NITROKEY_SDK_PY := nitrokey-sdk-py-$(NITROKEY_SDK_PY_VERSION)
NITROKEY_SDK_PY_ARCHIVE := $(NITROKEY_SDK_PY).tar.gz
NITROKEY_SDK_PY_LINK := source/components/software/nitrokey-sdk-py

.PHONY: docs
docs: venv
	venv/bin/sphinx-build -j auto -b html -D language=en -d build/en/doctrees source dist/en

.PHONY: venv
venv: $(NITROKEY_SDK_PY)
	python -m venv venv
	venv/bin/pip3 install -r requirements.txt
	venv/bin/pip3 install ./$(NITROKEY_SDK_PY)

.PHONY: check
check: venv
	# ignore-messages is needed due to links being used in directives, which
	# are not visible by rstcheck as these directives are ignored (mostly faq)
	venv/bin/rstcheck --recursive --ignore-directives tabs,faq,product-table \
		--ignore-messages "faq(.*)Hyperlink target(.*)is not referenced" \
		source

pkg: venv docs
	mv dist/en/_images dist/_images
	rm -rf dist/*/_sources dist/*/_images
	cp redirects/.htaccess dist
	

clean: 
	rm -rf dist build nitrokey-sdk-py* $(NITROKEY_SDK_PY_LINK)

cleaner: clean
	rm -rf venv
	
.PHONY: docs check pkg

$(NITROKEY_SDK_PY): $(NITROKEY_SDK_PY_ARCHIVE)
	mkdir "$@"
	tar --directory "$@" --extract --strip-components 1 --file "$<"
	rm -f $(NITROKEY_SDK_PY_LINK)
	ln -s ../../../$(NITROKEY_SDK_PY)/docs $(NITROKEY_SDK_PY_LINK)

$(NITROKEY_SDK_PY_ARCHIVE):
	curl "$(NITROKEY_SDK_PY_URL)" --location --output "$@"
	echo "$(NITROKEY_SDK_PY_CHECKSUM) $@" | sha256sum -c
