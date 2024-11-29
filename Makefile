NITROKEY_SDK_PY_VERSION ?= v0.2.3
NITROKEY_SDK_PY_CHECKSUM ?= b0547efe0bce6907f831a80297baf5393825037d3996edd6cf9f1ccc796e736e

NITROKEY_SDK_PY_URL := https://github.com/Nitrokey/nitrokey-sdk-py/archive/refs/tags/$(NITROKEY_SDK_PY_VERSION).tar.gz
NITROKEY_SDK_PY := nitrokey-sdk-py-$(NITROKEY_SDK_PY_VERSION)
NITROKEY_SDK_PY_ARCHIVE := $(NITROKEY_SDK_PY).tar.gz
NITROKEY_SDK_PY_LINK := source/components/software/nitrokey-sdk-py

.PHONY: all
all: venv
	venv/bin/sphinx-build -j auto -b html -D language=en -d build/en/doctrees source dist/en

.PHONY: venv
venv: $(NITROKEY_SDK_PY)
	python -m venv venv
	venv/bin/pip3 install -r requirements.txt
	venv/bin/pip3 install ./$(NITROKEY_SDK_PY)

$(NITROKEY_SDK_PY): $(NITROKEY_SDK_PY_ARCHIVE)
	mkdir "$@"
	tar --directory "$@" --extract --strip-components 1 --file "$<"
	rm -f $(NITROKEY_SDK_PY_LINK)
	ln -s ../../../$(NITROKEY_SDK_PY)/docs $(NITROKEY_SDK_PY_LINK)

$(NITROKEY_SDK_PY_ARCHIVE):
	curl "$(NITROKEY_SDK_PY_URL)" --location --output "$@"
	echo "$(NITROKEY_SDK_PY_CHECKSUM) $@" | sha256sum -c

.PHONY: clean
clean:
	rm -rf dist build venv nitrokey-sdk-py* $(NITROKEY_SDK_PY_LINK)
