#!/usr/bin/env bash

set -e;

if [[ -z "$1" ]]; then
    echo 'Aborting script because need to pass in the name of the branch.';
    exit 1;
fi

if [[ ! -d "node_modules" ]]; then
    echo "you need to run this script from the project root";
    exit 1;
fi

feature_branch_name="hotfix/$1";

read -p "Your new branch will be named '${feature_branch_name}', does that work for you (use y/n)?" -n 1 -r
echo ""; # echo new line

if [[ ${REPLY} =~ ^[Yy]$ ]]; then

    git checkout master;
    git fetch origin;
    git merge origin/master;
    git checkout -b "${feature_branch_name}";
    echo "you are now on your new feature branch => $(git branch -v)"

else

    echo "you declined to proceed, so be it."

fi