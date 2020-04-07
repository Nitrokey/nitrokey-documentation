# README

## Setup

This documentation is based on [VuePress](https://vuepress.vuejs.org/). It's a static page generator so that for testing purposes you need to [install VuePress on your local system](https://v1.vuepress.vuejs.org/guide/getting-started.html#global-installation):

```bash
# Install

sudo apt install npm
sudo npm install -g vuepress

# Start editing content

# Test your content locally

sudo vuepress dev

# Publish changes
./deploy.sh
```

## Tips and Conventions

* Menus and other settings are defined in `.vuepress/config.js`.
* Write filenames in lower case and use dashes ("-") instead of spaces.
* For content which is identical for different models or operating systems, use symbolic links to avoid duplication of files.

