#!/bin/bash
if [ -z "$1" ]
then
    echo "Please provide a name for the app"
    exit 1
fi

echo "creating vite ts app " "$1"

git clone https://github.com/DKormann/template_appy.git

mv template_appy "$1"

cd "$1"

rm -rf .git

find . -type f -exec sh -c "LC_CTYPE=C sed -i '' \"s/template_appy/$1/g\" {}" \;

npm install .

git init .

git remote add origin https://github.com/$(git config github.user)/$1.git
git push -u origin main



echo "live development: npm run dev"
echo "to build run: npm run build"
