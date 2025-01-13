#!/bin/bash

echo "=========================="
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

npx ts-node /usr/bin/feed.ts

git add -A && git commit -m "Update Feed"
git push --set-upstream origin main
echo "=========================="