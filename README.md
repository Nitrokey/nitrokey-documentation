# Nitrokey Documentation

### Local build

Be sure to have a recent python installed, then:

```
make
```

The (english) result is to be found in `dist/en`, to show run:
```
firefox dist/en/index.html
```

### More Makefile Targets

* `clean` will clean up generated files
* `cleaner` includes `venv/`
* `check` runs `rstcheck` for the sources
* `venv` creates a virtualenv with all deps
* `docs` first target, default, will quick-build the english docs
* `pkg` assembles a package for deployment in `dist` (unused)

### Localization

You can find the locales for this repository here: https://github.com/Nitrokey/nitrokey-documentation-data
