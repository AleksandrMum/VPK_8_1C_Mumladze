#!/bin/bash

# Проверка, что мы в git-репозитории
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Ошибка: не в git-репозитории!"
    exit 1
fi

# Запрос сообщения коммита
read -p "Введите сообщение коммита: " commit_msg

# Stage всех изменений, коммит и push
git add .
git commit -m "$commit_msg"
git push

echo "Изменения закоммичены и запушены."
read -p "Нажмите Enter для выхода..."
