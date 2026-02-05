#!/bin/bash
set -e

REPO_NAME="tandoor-landing"
GITHUB_USER="karenavedikyan"

echo "🚀 Создание репозитория и публикация TANDOOR лендинга..."

# Проверяем наличие файлов
if [ ! -f "index.html" ]; then
    echo "❌ Ошибка: index.html не найден"
    exit 1
fi

# Удаляем старый remote если есть
git remote remove origin 2>/dev/null || true

# Добавляем новый remote
echo "📡 Настройка remote..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git" 2>/dev/null || \
git remote set-url origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

# Устанавливаем ветку main
git branch -M main

# Пробуем запушить
echo "⬆️  Отправка кода на GitHub..."
if git push -u origin main 2>&1; then
    echo ""
    echo "✅ Успешно опубликовано!"
    echo "🌐 Репозиторий: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo "📄 GitHub Pages: https://$GITHUB_USER.github.io/$REPO_NAME/"
else
    echo ""
    echo "⚠️  Репозиторий еще не создан на GitHub."
    echo "📝 Создайте его здесь: https://github.com/new"
    echo "   Имя: $REPO_NAME"
    echo "   Затем запустите этот скрипт снова."
fi
