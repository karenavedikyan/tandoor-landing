#!/bin/bash

# Скрипт для публикации TANDOOR лендинга на GitHub
# Использование: ./publish.sh <repository-name>
# Пример: ./publish.sh tandoor-landing

REPO_NAME=${1:-tandoor-landing}
GITHUB_USER="karenavedikyan"

echo "🚀 Публикация TANDOOR лендинга на GitHub..."
echo "📦 Имя репозитория: $REPO_NAME"

# Проверяем, что мы в правильной директории
if [ ! -f "index.html" ]; then
    echo "❌ Ошибка: index.html не найден. Запустите скрипт из папки tandoor/"
    exit 1
fi

# Проверяем наличие git
if ! command -v git &> /dev/null; then
    echo "❌ Git не установлен"
    exit 1
fi

# Добавляем remote (если еще не добавлен)
if ! git remote | grep -q origin; then
    echo "📡 Добавление remote origin..."
    git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
else
    echo "📡 Обновление remote origin..."
    git remote set-url origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
fi

# Пушим в GitHub
echo "⬆️  Отправка кода на GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Успешно опубликовано!"
    echo "🌐 Репозиторий: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo "📄 GitHub Pages: https://$GITHUB_USER.github.io/$REPO_NAME/"
    echo ""
    echo "💡 Для включения GitHub Pages:"
    echo "   1. Перейдите в Settings репозитория"
    echo "   2. В разделе Pages выберите 'Deploy from a branch'"
    echo "   3. Выберите branch: main, folder: / (root)"
else
    echo ""
    echo "⚠️  Не удалось отправить код автоматически."
    echo "📝 Создайте репозиторий на GitHub вручную:"
    echo "   1. Перейдите на https://github.com/new"
    echo "   2. Создайте репозиторий с именем: $REPO_NAME"
    echo "   3. Затем выполните:"
    echo "      git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "      git branch -M main"
    echo "      git push -u origin main"
fi
