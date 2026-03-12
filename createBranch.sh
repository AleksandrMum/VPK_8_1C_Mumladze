#!/bin/bash

# Запрос имени ветки
read -p "Введите имя ветки (например, lab1): " branch_name

# Проверка, что мы в git-репозитории
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Ошибка: не в git-репозитории!"
    exit 1
fi

# Создание и переключение на новую ветку
git checkout -b "$branch_name"

# Публикация с set-upstream
git push --set-upstream origin "$branch_name"

echo "Ветка '$branch_name' создана и опубликована на GitHub."
read -p "Нажмите Enter для выхода..."
