# Django + mariadb в контейнерах

### Сделано по статье https://habr.com/ru/post/519912/

### устанавливаем docker и docker-compose
sudo chmod +x docker.sh
sudo ./docker.sh

### создаем сеть для Nginx (предполагается, что уже есть контейнер с NGINX или NGINX-PM)
docker network create --driver=bridge nginx-net

### в файл docker-compose.yml с вашим обратным прокси добавляем
networks:
  nginx-net:
    external:
      name: nginx-net
  default:
    driver: bridge
    
- Все контейнеры, к которым обратный прокси должен обращаться по имени должны быть в сети nginx-net!

### запускаем контейнер web для создания проекта project1
sudo docker-compose run web django-admin startproject

### меняем владельца созданной папки и файла
sudo chown -R $USER:$USER project1
sudo chown -R $USER:$USER manage.py

### меняем настройки БД на mysql

vim project1/settings.py
вставляем:
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'db_django',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': '3306',
    }
}

### запускаем, проверяем, есть ли ошибки

docker-compose up

### если все ок, выполняем миграцию БД

docker-compose run web python manage.py makemigrations
docker-compose run web python manage.py migrate
