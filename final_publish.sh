#!/bin/bash
set -e

REPO_NAME="tandoor-landing"
GITHUB_USER="karenavedikyan"

echo "🚀 Финальная настройка и публикация..."

# Убеждаемся что все закоммичено
git add -A 2>/dev/null || true
git commit -m "Final setup" 2>/dev/null || true

# Настраиваем remote
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
git branch -M main

echo ""
echo "✅ Все готово к публикации!"
echo ""
echo "📦 Создайте репозиторий на GitHub:"
echo "   https://github.com/new"
echo "   Имя: $REPO_NAME"
echo "   Public: ✓"
echo ""
echo "Затем выполните:"
echo "   git push -u origin main"
echo ""
echo "Или просто запустите этот скрипт снова после создания репозитория."
