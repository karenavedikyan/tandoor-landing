#!/bin/bash

REPO_NAME="tandoor-landing"
GITHUB_USER="karenavedikyan"

echo "🚀 Создание репозитория и публикация TANDOOR лендинга"
echo ""

# Проверяем наличие токена
if [ -z "$GITHUB_TOKEN" ]; then
    echo "💡 Для автоматического создания репозитория нужен GitHub Personal Access Token"
    echo "   Получить можно здесь: https://github.com/settings/tokens"
    echo ""
    read -p "Введите GitHub Token (или нажмите Enter для пропуска): " token
    if [ -n "$token" ]; then
        export GITHUB_TOKEN="$token"
    fi
fi

# Создаем репозиторий через API если есть токен
if [ -n "$GITHUB_TOKEN" ]; then
    echo "📦 Создание репозитория через GitHub API..."
    response=$(curl -s -w "\n%{http_code}" -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d "{\"name\":\"$REPO_NAME\",\"public\":true,\"description\":\"TANDOOR - Premium door hardware landing page\",\"auto_init\":false}")
    
    http_code=$(echo "$response" | tail -n1)
    body=$(echo "$response" | sed '$d')
    
    if [ "$http_code" = "201" ]; then
        echo "✅ Репозиторий успешно создан!"
    elif [ "$http_code" = "422" ]; then
        echo "ℹ️  Репозиторий уже существует, продолжаем..."
    else
        echo "⚠️  Не удалось создать через API (код: $http_code)"
        echo "$body" | head -5
    fi
fi

# Настраиваем git
echo "📡 Настройка git remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git" 2>/dev/null || \
git remote set-url origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
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
    echo "⚠️  Репозиторий еще не создан на GitHub."
    echo ""
    echo "📝 Создайте его здесь: https://github.com/new"
    echo "   Имя: $REPO_NAME"
    echo "   Public: ✓"
    echo ""
    echo "   Затем запустите: git push -u origin main"
fi
