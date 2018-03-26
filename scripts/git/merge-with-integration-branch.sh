#!/usr/bin/env bash

# you should be on a feature
# if you are on dev or master, this script will exit early

set -e;

BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" == "master" || "$BRANCH" == "dev" ]]; then
    echo 'Aborting script because you are not on a feature git branch.';
    exit 1;
fi

if [[ ! -d "node_modules" ]]; then
    echo "you need to run this script from the project root";
    exit 1;
fi

git add .
git add -A
git commit --allow-empty -am "cdt-integration-branch-commit"
git fetch origin
git merge -Xignore-all-space origin/dev


