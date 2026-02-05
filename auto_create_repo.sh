#!/bin/bash

REPO_NAME="tandoor-landing"
GITHUB_USER="karenavedikyan"

echo "🚀 Автоматическое создание репозитория и публикация TANDOOR..."

# Пробуем создать через GitHub API (если есть токен в переменной окружения)
if [ -n "$GITHUB_TOKEN" ]; then
    echo "📦 Создание репозитория через API..."
    response=$(curl -s -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d "{\"name\":\"$REPO_NAME\",\"public\":true,\"description\":\"TANDOOR - Premium door hardware landing page\",\"auto_init\":false}")
    
    if echo "$response" | grep -q '"name"'; then
        echo "✅ Репозиторий создан через API!"
    else
        echo "⚠️  Не удалось создать через API: $response"
    fi
fi

# Настраиваем git
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
git branch -M main

# Пробуем запушить
echo "⬆️  Отправка кода на GitHub..."
if git push -u origin main 2>&1; then
    echo ""
    echo "🎉 УСПЕШНО ОПУБЛИКОВАНО!"
    echo ""
    echo "🌐 Репозиторий: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo "📄 GitHub Pages: https://$GITHUB_USER.github.io/$REPO_NAME/"
    echo ""
    echo "💡 Для включения GitHub Pages:"
    echo "   Settings → Pages → Deploy from branch: main"
else
    echo ""
    echo "📝 Репозиторий нужно создать вручную:"
    echo ""
    echo "   1. Откройте: https://github.com/new"
    echo "   2. Repository name: $REPO_NAME"
    echo "   3. Выберите: Public"
    echo "   4. НЕ добавляйте README, .gitignore или лицензию"
    echo "   5. Нажмите: Create repository"
    echo ""
    echo "   Затем запустите:"
    echo "   git push -u origin main"
fi
