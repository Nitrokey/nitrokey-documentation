# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
#
# This file does only contain a selection of the most common options. For a
# full list see the documentation:
# http://www.sphinx-doc.org/en/master/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = "Nitrokey Documentation"
copyright = "Nitrokey"
author = "Nitrokey"

# The short X.Y version
version = ""
# The full version, including alpha/beta/rc tags
release = ""


# -- General configuration ---------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    "sphinx.ext.todo",
    "sphinx.ext.coverage",
    #'sphinx_copybutton',
    #'sphinxprettysearchresults',
    "sphinx_tabs.tabs",
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ["_templates"]

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = {".rst": "restructuredtext"}

# The master toctree document.
master_doc = "index"

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
# language = None
language = "en"
locales_dir = ["../../locales"]
gettext_compact = True

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [
    "venv/*",
    "components/nethsm/_*.rst",
    "components/to-be-integrated.rst",
]

# The name of the Pygments (syntax highlighting) style to use.
# pygments_style = "solarizeddark"
# pygments_style = "cheerfully_dark"
pygments_style = "sphinx"
pygments_dark_style = "monokai"

highlight_language = "none"

highlight_options = {
    "default": {"stripall": True},
    "bash": {"startinline": True},
}

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#

# Show "Edit on Github
# "theme_vcs_pageview_mode" must be blob to have the right URL!
html_context = {
    "display_github": True,  # Integrate GitHub
    "github_user": "Nitrokey",  # Username
    "github_repo": "nitrokey-documentation",
    "github_version": "",  # Version
    "conf_py_path": "main/source/components/",  # Path in the checkout to the docs root
    "suffix": ".rst",
    "copyrightlink": "https://www.nitrokey.com",
    "languages": {
        "de": "Deutsch",
        "en": "English",
        "fr": "français",
        "es": "Español",
        "nl": "Nederlands",
        "it": "Italiano",
        "ja": "やまと",
        "ru": "Русский",
        "zh_CN": "中国",
        "el": "Ελληνική",
        "da": "Dansk",
        "bg": "Български",
        "et": "Eesti",
        "fi": "Suomi",
        "lv": "Latviešu",
        "lt": "Lietuvių kalba",
        "pl": "Polski",
        "pt": "Português",
        "ro": "Românesc",
        "sv": "Svenska",
        "sk": "Slovenská",
        "sl": "Slovenski",
        "cs": "Česky",
        "hu": "Magyar",
    },
    "lang_switch_info": {
        "de": "Diese Seite ist auf Deutsch verfügbar.",
        "en": "This page is available in English.",
        "fr": "Cette page est disponible en français",
        "es": "Esta página está disponible en español.",
        "nl": "Deze pagina is beschikbaar in het Nederlands.",
        "it": "Questa pagina è disponibile in italiano.",
        "ja": "このページは日本語でご覧いただけます。",
        "ru": "Эта страница доступна на русском языке.",
        "zh_CN": "本页有中文版本。",
        "el": "Αυτή η σελίδα είναι διαθέσιμη στα ελληνικά.",
        "bg": "Тази страница е достъпна на български език.",
        "da": "Denne side er tilgængelig på dansk.",
        "et": "See lehekülg on saadaval eesti keeles.",
        "fi": "Tämä sivu on saatavilla suomeksi.",
        "lv": "Šī lapa ir pieejama latviešu valodā.",
        "lt": "Šis puslapis pateikiamas lietuvių kalba.",
        "pl": "Ta strona jest dostępna w języku polskim.",
        "pt": "Esta página está disponível em português.",
        "ro": "Această pagină este disponibilă în limba română.",
        "sv": "Den här sidan finns på svenska.",
        "sk": "Táto stránka je k dispozícii v slovenčine.",
        "sl": "Ta stran je na voljo v slovenščini.",
        "cs": "Tato stránka je k dispozici v češtině.",
        "hu": "Ez az oldal magyar nyelven érhető el.",
    },
    "lang_switch_label": {
        "de": "Auf Deutsch ansehen",
        "en": "Switch to English",
        "fr": "Passer au français",
        "es": "Cambia al español.",
        "nl": "Schakel over op Nederlands.",
        "it": "Passa all`italiano.",
        "ja": "日本語に切り替えます。",
        "ru": "Переключитесь на русский язык.",
        "zh_CN": "换成中文。",
        "el": "Αλλαγή σε ελληνικά.",
        "bg": "Преминете на български език.",
        "da": "Skift til dansk.",
        "et": "Vahetage eesti keelele.",
        "fi": "Vaihda suomeksi.",
        "lv": "Pārslēgties uz latviešu valodu.",
        "lt": "Perjunkite į lietuvių kalbą.",
        "pl": "Przełącz się na język polski.",
        "pt": "Mudar para português.",
        "ro": "Treceți la limba română.",
        "sv": "Växla till svenska.",
        "sk": "Prepnite na slovenčinu.",
        "sl": "Preklopite na slovenščino.",
        "cs": "Přepněte na češtinu.",
        "hu": "Váltson magyarra.",
    },
    "dismiss_label": {
        "de": "Ausblenden",
        "en": "Dismiss",
        "fr": "Cacher",
        "es": "Ocultar",
        "nl": "Verberg",
        "it": "Nascondi",
        "ja": "隠す",
        "ru": "Скрыть",
        "zh_CN": "隐藏",
        "el": "Απόκρυψη",
        "bg": "Скрий",
        "da": "Skjul",
        "et": "Peida",
        "fi": "Piilota",
        "lv": "Paslēpt",
        "lt": "Paslėpti",
        "pl": "Ukryj",
        "pt": "Esconder",
        "ro": "Ascundeți",
        "sv": "Dölj",
        "sk": "Skryť",
        "sl": "Skrij",
        "cs": "Skrýt",
        "hu": "Rejtsd el",
    },
}

html_theme = "furo"

html_theme_options = {
    # Furo options
    "light_logo": "logo.png",
    "dark_logo": "logo.png",
    "light_css_variables": {
        "color-logo-text": "#181818",
        "color-brand-primary": "#c70336",
        "color-brand-content": "#c70336",
        "color-brand-content-hover": "#ef144d",
        "color-content-foreground": "#131416",
        "color-definition-list-background": "#efecf6",
        "color-definition-list-text": "#000",
        "color-sidebar-background": "#f5f6fb",
        "color-sidebar-link-text": "#131416",
        "color-sidebar-links-hover": "#111",
        "color-sidebar-link-text--top-level": "#000",
        "color-sidebar-border": "#e8e7f1",
        "color-sidebar-search-background": "#fff",
        "color-sidebar-search-background--focus": "#f5f6fb",
        "color-sidebar-select-background": "#fff",
        "color-sidebar-select-border": "#e8e7f1",
        "font-stack": "'Open Sans', Helvetica, Arial, sans-serif",
        "font-stack--monospace": "'Operator mono', 'Hack', 'Menlo', Consolas, 'Andale Mono WT', 'Andale Mono', 'Lucida Console', 'Lucida Sans Typewriter', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Liberation Mono', 'Nimbus Mono L', Monaco, 'Courier New', Courier, monospace",
        "color-admonition-title--todo": "#222222",
        "color-admonition-title-background--todo": "#d6e3ed",
        "color-admonition-title-background--note": "#6ab0de",
        "color-admonition-title-background--tip": "#1abc9c",
        "color-admonition-title-background--hint": "#1abc9c",
        "color-admonition-title-background--important": "#1abc9c",
        "color-admonition-title-background--warning": "#C70336",
        "color-admonition-background": "#e7f2fa",
        "color-admonition-background--note": "#e6edf1",
        "color-admonition-background--tip": "#adf8e9",
        "color-admonition-background--hint": "#adf8e9",
        "color-admonition-background--important": "#adf8e9",
        "color-admonition-background--warning": "#f8e2e2",
        "color-code": "#ddd",
        "color-code-background": "#3c4142",
    },
    "dark_css_variables": {
        "color-logo-text": "#eee",
        "color-brand-primary": "#c70336",
        "color-brand-content": "#ef144d",
        "color-brand-content-hover": "#c70336",
        "color-background-primary": "#18191d",
        "color-content-foreground": "#eee",
        "color-definition-list-background": "#1c1f28",
        "color-definition-list-text": "#fff",
        "color-sidebar-background": "#141516",
        "color-sidebar-link-text": "#eee",
        "color-sidebar-links-hover": "#141516",
        "color-sidebar-link-text--top-level": "#fff",
        "color-sidebar-border": "#1f1f1f",
        "color-sidebar-search-background": "#141516",
        "color-sidebar-search-background--focus": "#000",
        "color-sidebar-select-background": "#2a2a2a",
        "color-sidebar-select-border": "#666",
        "font-stack": "'Open Sans', Helvetica, Arial, sans-serif",
        "font-stack--monospace": "'Operator mono', 'Hack', 'Menlo', Consolas, 'Andale Mono WT', 'Andale Mono', 'Lucida Console', 'Lucida Sans Typewriter', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Liberation Mono', 'Nimbus Mono L', Monaco, 'Courier New', Courier, monospace",
        "color-admonition-title--todo": "#ffffff",
        "color-admonition-title-background--todo": "#0a6150",
        "color-admonition-title-background--note": "#6ab0de",
        "color-admonition-title-background--tip": "#1abc9c",
        "color-admonition-title-background--hint": "#1abc9c",
        "color-admonition-title-background--important": "#1abc9c",
        "color-admonition-title-background--warning": "#c70336",
        "color-admonition-background": "#208571",
        "color-admonition-background--note": "#2a6592",
        "color-admonition-background--tip": "#208571",
        "color-admonition-background--hint": "#208571",
        "color-admonition-background--important": "#208571",
        "color-admonition-background--warning": "#4e1d1d",
        "color-code": "#ddd",
        "color-code-background": "#000",
    },
}

html_title = "Nitrokey Documentation"
# html_logo = "logo.png"
html_favicon = "favicon.ico"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ["_static"]

# Adjusting the divio Theme CSS
#   The mechanism of html_style and also adding the custom.css overwriting the divio.css generated by the theme didn't work out.
#   So the following divio.css is hard coded in _static/css for making the logo invisible
html_css_files = [
    "css/custom.css",
]

# Custom sidebar templates, must be a dictionary that maps document names
# to template names.
#
# The default sidebars (for documents that don't match any pattern) are
# defined by theme itself.  Builtin themes are using these templates by
# default: ``['localtoc.html', 'relations.html', 'sourcelink.html',
# 'searchbox.html']``.
#
html_sidebars = {
    "**": [
        "sidebar/scroll-start.html",
        "sidebar/brand.html",
        "sidebar/search.html",
        "sidebar/navigation.html",
        "sidebar/scroll-end.html",
    ]
}


# -- Options for HTMLHelp output ---------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = "Nitrokeydoc"

# -- Options for LaTeX output ------------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',
    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',
    # Additional stuff for the LaTeX preamble.
    #
    # 'preamble': '',
    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, "Nitrokey.tex", "Nitrokey Documentation", "Nitrokey", "manual"),
]


# -- Options for manual page output ------------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [(master_doc, "nitrokey", "Nitrokey Documentation", [author], 1)]


# -- Options for Texinfo output ----------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (
        master_doc,
        "Nitrokey",
        "Nitrokey Documentation",
        author,
        "Nitrokey",
        "One line description of project.",
        "Miscellaneous",
    ),
]


# -- Options for Epub output -------------------------------------------------

# Bibliographic Dublin Core info.
epub_title = project

# The unique identifier of the text. This can be a ISBN number
# or the project homepage.
#
# epub_identifier = ''

# A unique identification for the text.
#
# epub_uid = ''

# A list of files that should not be packed into the epub file.
epub_exclude_files = ["search.html"]


# -- Extension configuration -------------------------------------------------

# -- Options for todo extension ----------------------------------------------

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = True

# -- Options for tabs extension-----------------------------------------------

# Disables the closing of tabs if clicked on the currently active tab
sphinx_tabs_disable_tab_closing = True
