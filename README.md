Nitrokey Documentation
======================

[![Build Status](https://travis-ci.org/Nitrokey/nitrokey-documentation.svg)](https://travis-ci.org/Nitrokey/nitrokey-documentation)

Nitrokey's User Documentation

## Setup

This documentation is based on [VuePress](https://vuepress.vuejs.org/). It's a static page generator so that for testing purposes you need to [install VuePress on your local system](https://v1.vuepress.vuejs.org/guide/getting-started.html#global-installation):

1. Install

```
sudo apt install npm
sudo npm install -g vuepress
```
2. Start editing content

3. Test your content locally

```
sudo vuepress dev
```

4. Publish changes by pushing to git

## Tips and Conventions

* Menus and other settings are defined in `.vuepress/config.js`.
* Write filenames in lower case and use dashes ("-") instead of spaces.
* For content which is identical for different models or operating systems, use symbolic links to avoid duplication of files. Locate those instructions not in but next to the operating system folders.
* Add a subfolder with the numbered image files for each guide.
