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

## Guidelines
The following are guidline rules for writing documentation to make it uniform and comprehensive.

### Headlines

When writing title case headlines, major words are capitalized while minor words are lowercase.

* Major words are nouns, verbs, adjectives, pronouns, adverbs, and basically any word four letters or longer.
* Minor words are conjunctions that are three letters or less (e.g. and, or, nor, but), short prepositions (at, by, for, in, of, on), and all articles (a, an, the).

In addition, the following words should be capitalized under title case:

* The first word of the title — including minor words.
* The first word after any punctuation (semicolon, em dash, end punctuation, etc.) except for commas.
* Words four letters or longer (With, After, Then, etc.).
* All major words — including post-hyphen words (“Last-Minute” as opposed to “Last-minute”).



Title case headline examples:

    The Fargo Forum Found Fresh Fish
    7 Reasons Your Content Needs a Great Headline
    Local Pizza Shop Claims 'Best Pie in Town'


### Boxes
Boxes like note/warning/important should only contain added information. 
The author has to make sure, that if one would imaging removing all boxes in a certain article, it should still make sense and lead to the expected goal.

