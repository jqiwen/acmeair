#!/bin/bash
# 自动提交并推送所有子模块，然后提交主仓库更新
# 用法：bash push_all.sh "commit message"

# test

set -e

MSG=${1:-"update all submodules"}

echo ">>> Step 1: commit and push all submodules..."
git submodule foreach "git add . && git commit -m '$MSG' || echo 'No changes to commit in \$name'"
git submodule foreach "git push || echo 'No remote push needed for \$name'"

echo ">>> Step 2: update main repo pointers..."
git add .
git commit -m "$MSG"
git push

echo ">>> ✅ All repositories pushed successfully!"
