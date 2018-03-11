#!/usr/bin/env bash

# Ensure you are in master
git checkout master

# Ensure you are doing a pull
git pull

#Clean the dist
rm -rf dist/

#Package
npm run build --env=prod

# #Git commit and save after build
DATE_AND_TIME="$(date -u "+%Y-%m-%d %H:%M:%S")"
git add dist/
git commit -am "Publish new artifacts as of $DATE_AND_TIME"
git push


# # Delete Local Branch
# git branch -D gh-pages

# # Delete Remote Branch
# git push origin :gh-pages

#Create branch gh-pages
git subtree push --prefix dist/ origin gh-pages

# #Publish to remote
# git push --set-upstream origin gh-pages


# # Back to master
# git checkout master
