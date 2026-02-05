#!/bin/bash

REPO_NAME="tandoor-landing"
GITHUB_USER="karenavedikyan"

echo "🔍 Попытка автоматической публикации..."

# Пробуем создать репозиторий через GitHub API (если есть токен)
if [ -n "$GITHUB_TOKEN" ]; then
    echo "📦 Создание репозитория через API..."
    curl -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d "{\"name\":\"$REPO_NAME\",\"public\":true,\"description\":\"TANDOOR - Premium door hardware landing page\"}" \
        2>/dev/null && echo "✅ Репозиторий создан!" || echo "⚠️  Не удалось создать через API"
fi

# Настраиваем git
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git" 2>/dev/null || \
git remote set-url origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
git branch -M main

# Пробуем запушить
echo "⬆️  Отправка кода..."
if git push -u origin main 2>&1; then
    echo ""
    echo "✅ ГОТОВО! Сайт опубликован!"
    echo "🌐 https://github.com/$GITHUB_USER/$REPO_NAME"
    echo "📄 https://$GITHUB_USER.github.io/$REPO_NAME/"
else
    echo ""
    echo "📝 Репозиторий нужно создать вручную:"
    echo "   1. Откройте: https://github.com/new"
    echo "   2. Имя: $REPO_NAME"
    echo "   3. Public"
    echo "   4. Запустите: git push -u origin main"
fi
