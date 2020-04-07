#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build
# sudo vuepress build

# navigate into the build output directory
cd .vuepress/dist

echo 'doc.nitrokey.com' > CNAME

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:Nitrokey/nitrokey-documentation.git master:gh-pages

cd -
