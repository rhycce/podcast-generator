#!/bin/bash
echo "=========================="
xmlFile=$1
yamlFile=$2
echo "install npm and node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
node -v
npm -v
cd /home/node/app/ || exit
echo "Listing files in current directory"
ls -als
echo "install project dependencies and build project"
npm install
npm run build
echo "=========================="
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

echo "creating feed from ${yamlFile} to ${xmlFile}"
node dist/feed "${xmlFile}" "${yamlFile}"
cp ${xmlFile} /
echo "cd back to base"
cd || exit

echo "commit new git file"
git add -A && git commit -m "Update Feed"
git push --set-upstream origin main
echo "=========================="