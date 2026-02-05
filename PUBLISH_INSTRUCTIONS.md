# 📦 Инструкции по публикации TANDOOR на GitHub

## Вариант 1: Через веб-интерфейс GitHub (рекомендуется)

1. **Создайте новый репозиторий на GitHub:**
   - Перейдите на https://github.com/new
   - Имя репозитория: `tandoor-landing` (или любое другое)
   - Выберите **Public**
   - **НЕ** добавляйте README, .gitignore или лицензию (они уже есть)
   - Нажмите "Create repository"

2. **Отправьте код:**
   ```bash
   cd /Users/karenavedikyan/testcursor/tandoor
   git remote add origin https://github.com/karenavedikyan/tandoor-landing.git
   git branch -M main
   git push -u origin main
   ```

3. **Включите GitHub Pages:**
   - Перейдите в Settings → Pages
   - Source: Deploy from a branch
   - Branch: main, folder: / (root)
   - Сохраните

4. **Ваш сайт будет доступен по адресу:**
   `https://karenavedikyan.github.io/tandoor-landing/`

## Вариант 2: Использование скрипта

Если вы уже создали репозиторий на GitHub:

```bash
cd /Users/karenavedikyan/testcursor/tandoor
./publish.sh tandoor-landing
```

## Вариант 3: Через GitHub CLI (если установлен)

```bash
cd /Users/karenavedikyan/testcursor/tandoor
gh repo create tandoor-landing --public --source=. --remote=origin --push
```

---

**Текущий статус:**
- ✅ Git репозиторий инициализирован
- ✅ Все файлы добавлены и закоммичены
- ⏳ Ожидается создание репозитория на GitHub
