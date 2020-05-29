#!/bin/bash
mkdir b

export YARN_CACHE_FOLDER=$(mktemp -d)

cp ./b-package.json b/package.json
cp ./a-v1.0.0.tgz b/

cd b

yarn add file:a-v1.0.0.tgz
echo
echo
echo "Old lock"
cat yarn.lock
echo
echo
mkdir vendor
mv a-v1.0.0.tgz vendor/
yarn add file:./vendor/a-v1.0.0.tgz
echo
echo
echo "New lock"
cat yarn.lock
