#!/bin/bash
# Создание репозитория через GitHub API
# Требуется GitHub Personal Access Token

REPO_NAME="tandoor-landing"
GITHUB_USER="karenavedikyan"

echo "Создание репозитория $REPO_NAME на GitHub..."
echo ""
echo "Для создания репозитория через API нужен Personal Access Token."
echo ""
echo "Альтернативный способ (проще):"
echo "1. Перейдите на https://github.com/new"
echo "2. Создайте репозиторий: $REPO_NAME"
echo "3. Затем выполните:"
echo ""
echo "   git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
