# 🚀 Быстрая публикация TANDOOR на GitHub

## Шаг 1: Создайте репозиторий на GitHub

Перейдите на: **https://github.com/new**

- **Repository name:** `tandoor-landing`
- Выберите **Public**
- **НЕ** добавляйте README, .gitignore или лицензию
- Нажмите **"Create repository"**

## Шаг 2: Выполните эти команды

```bash
cd /Users/karenavedikyan/testcursor/tandoor
git remote add origin https://github.com/karenavedikyan/tandoor-landing.git
git branch -M main
git push -u origin main
```

## Шаг 3: Включите GitHub Pages

1. Перейдите в репозиторий: https://github.com/karenavedikyan/tandoor-landing
2. **Settings** → **Pages**
3. **Source:** Deploy from a branch
4. **Branch:** main, **Folder:** / (root)
5. Сохраните

## ✅ Готово!

Ваш сайт будет доступен по адресу:
**https://karenavedikyan.github.io/tandoor-landing/**

---

**Или используйте готовый скрипт:**
```bash
cd /Users/karenavedikyan/testcursor/tandoor
./publish.sh tandoor-landing
```
(После создания репозитория на GitHub)
