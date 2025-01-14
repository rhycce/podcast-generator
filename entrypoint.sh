#!/bin/bash
echo "=========================="
xmlFile=$1
yamlFile=$2
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
node -v
npm -v
cd /home/node/app/ || exit
npm install
npm run build
echo "=========================="
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

echo "creating feed from ${yamlFile} to ${xmlFile}"
node dist/feed "${xmlFile}" "${yamlFile}"
cp ${xmlFile} /
cd

git add -A && git commit -m "Update Feed"
git push --set-upstream origin main
echo "=========================="