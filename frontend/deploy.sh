#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service

#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-${VERSION}.tar.gz ${NEXUS_REPO_URL}/sausage-store-saprykin-daniil-frontend/sausage-store/${VERSION}/sausage-store-${VERSION}.tar.gz
tar -xvf sausage-store-${VERSION}.tar.gz
sudo cp -r frontend/. /var/www-data/

sudo systemctl daemon-reload
#Перезапускаем сервис сосисочной
sudo systemctl restart sausage-store-backend

#Удаляем ненужные артефакты
sudo rm -f sausage-store-${VERSION}.tar.gz||true
sudo rm -rf frontend||true