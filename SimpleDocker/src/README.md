[image-id-1]: images/1-1-docker-pull-nginx.png
[image-id-2]: images/1-2-docker-images.png
[image-id-3]: images/1-3-docker-run.png
[image-id-4]: images/1-4-docker-ps.png
[image-id-5]: images/1-5-docker-inspect.png
[image-id-6]: images/1-6-docker-inspect-size.png
[image-id-7]: images/1-7-docker-inspect-ports.png
[image-id-8]: images/1-8-docker-inspect-ip.png
[image-id-9]: images/1-9-docker-stop.png
[image-id-10]: images/1-10-docker-run-80-443.png
[image-id-11]: images/1-11-localhost-80.png
[image-id-12]: images/1-12-docker-restart-ps.png
[image-id-13]: images/2-1-docker-exec.png
[image-id-14]: images/2-2-ngnix-conf.png
[image-id-15]: images/2-3-ngnix-conf-docker-cp.png
[image-id-16]: images/2-4-docker-export-stop.png
[image-id-17]: images/2-5-docker-rmi.png
[image-id-18]: images/2-6-docker-rm-container.png
[image-id-19]: images/2-7-docker-container-tar-import.png
[image-id-20]: images/3-1-server.png
[image-id-21]: images/3-2-ngnix-conf.png
[image-id-22]: images/3-3-docker-pull-ngnix.png
[image-id-23]: images/3-4-docker-cp-server-nginx-conf.png
[image-id-24]: images/3-5-check-server-nginx-conf.png
[image-id-25]: images/3-6-gcc-spawn-dcgi-libfcgi-dev.png
[image-id-26]: images/3-7-compile-start-server.png
[image-id-27]: images/3-8-reload-check.png
[image-id-28]: images/4-1-dockerfile.png
[image-id-29]: images/4-2-start-sh.png
[image-id-30]: images/4-3-build-map-check.png
[image-id-31]: images/4-4-nginx-proxy.png
[image-id-32]: images/4-5-nginx-status.png
[image-id-33]: images/5-1-dockle-error.png
[image-id-34]: images/5-2-dockle-error-hide.png
[image-id-35]: images/6-1-docker-compose.png
[image-id-36]: images/6-2-docker-compose-build.png
[image-id-37]: images/6-3-docker-compose-up.png
[image-id-38]: images/6-4-curl-check.png
[image-id-39]: images/6-5-stop-remove.png

- [Simple Docker.](#simple-docker)
- [Part 1. Готовый докер.](#part-1-готовый-докер)
- [Part 2. Операции с контейнером.](#part-2-операции-с-контейнером)
- [Part 3. Мини веб-сервер.](#part-3-мини-веб-сервер)
- [Part 4. Свой докер.](#part-4-свой-докер)
- [Part 5. Dockle.](#part-5-dockle)
- [Part 6. Базовый Docker Compose.](#part-6-базовый-docker-compose)

## Simple Docker.

## Part 1. Готовый докер.

1.1 Взять официальный докер образ с nginx и выкачать его при помощи `docker pull nginx`:
![image-id-1][]

1.2 Проверка наличия докер образа при помощи команды `docker images`:
![image-id-2][]

1.3 Запустить докер образ через `docker run -d [image_id|repository]`:
![image-id-3][]

1.4 Проверить, что образ запустился через `docker ps`:
![image-id-4][]

1.5 Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`:
![image-id-5][]

Размер контейнера:  
![image-id-6][]

Список замапленных портов:
![image-id-7][]

Ip контейнера:
![image-id-8][]

1.6 Остановить докер образ через `docker stop [container_id|container_name]` и проверить, что образ остановился через `docker ps`:
![image-id-9][]

1.7 Запустить докер с замапленными портами 80 и 443 на локальную машину через команду `docker run -d -p 80:80 -p 443:443 [container_id|container_name]`:
![image-id-10][]

1.8 Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx командой `curl localhost:80`:
![image-id-11][]

1.9 Перезапустить докер контейнер через `docker restart [container_id|container_name]` и проверить что он запустился `docker ps`:
![image-id-12][]

## Part 2. Операции с контейнером.

2.1 Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду `docker exec [container_id|container_name]`:
![image-id-13][]

2.2 Создание на локальной машине файла nginx.conf. Настройка в нем по пути /status отдачу страницы статуса сервера:

    user  nginx;
    worker_processes  auto;

    error_log  /var/log/nginx/error.log notice;
    pid        /var/run/nginx.pid;


    events {
        worker_connections  1024;
    }


    http {
        server {
            location /status {
                stub_status on;
            }
        }
    }
![image-id-14][]

2.3 Копирование файла nginx.conf внутрь докер образа `docker cp [container_id|container_name]:/etc/ngnix/`. 
Перезапуск nginx внутри докер образа `docker exec [container_id|container_name] nginx -s reload`. 
Проверка статуса сервера  `curl localhost:80/status`:
![image-id-15][]

2.4 Экспорт контейнера в файл `docker export [container_id|container_name] > container.tar`. Остановка контейнера `docker stop [container_id|container_name]`:
![image-id-16][]

2.5 Удаление образа `docker rmi [container_id|container_name] -f`:
![image-id-17][]

2.6 Удаление остановленного контейнера `docker rm [container_id|container_name]`:
![image-id-18][]

2.7 Импорт контейнера обратно `docker import -c 'cmd ["nginx", "-g", "daemon off;"]' -c 'ENTRYPOINT ["/docker-entrypoint.sh"]' container.tar nginx1`. 
Запуск импортированного контейнера `docker run -d -p 80:80 -p 443:443 [container_id|container_name]`. 
Проверка работоспособности контейнера `curl localhost:80/status`:
![image-id-19][]

## Part 3. Мини веб-сервер.

**Создаем папку в src `mkdir server-3`, внутри server-3 создаем папку `mkdir nginx`, внутри папки nginx создаем конфигурационный файл `touch nginx.conf`**

3.1 Создание сервера на языке С:

**Установите библиотеки при работе на Ubuntu:**
`sudo apt-get install -y spawn-fcgi` и `sudo apt-get install -y libfcgi-dev`

    #include "fcgi_stdio.h"
    #include <stdlib.h>

    int main(void) {
        while(FCGI_Accept() >= 0) {
            printf("Content-type: text/html\r\nStatus: 200 OK\r\n\r\nHello World!\n");
        }
        return 0;
    }
![image-id-20][]

3.2 Создание nginx.conf:

    user  nginx;
        worker_processes  auto;

        error_log  /var/log/nginx/error.log notice;
        pid        /var/run/nginx.pid;


        events {
            worker_connections  1024;
        }


        http {
            server {
                listen 81;
                listen [::]:81;

                location / {
                    fastcgi_pass 127.0.0.1:8080;
                }
            }

            include       /etc/nginx/mime.types;
            default_type  application/octet-stream;

            log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                            '$status $body_bytes_sent "$http_referer" '
                            '"$http_user_agent" "$http_x_forwarded_for"';

            access_log  /var/log/nginx/access.log  main;

            sendfile        on;

            keepalive_timeout  65;
        }
![image-id-21][]

3.3 Выкачка докера nginx. Проверка, что загрузка прошла успешно. Запуск образа и проверка, что он запустился:
![image-id-22][]

3.4 Копирование nginx.conf `docker cp ./ngnix/ngnix.conf [container_id|container_name]:/etc/nginx/`и server.c  `docker cp server.c [container_id|container_name]:/home/` в докер-контейнер:
![image-id-23][]

3.5 Вход в сам контейнер `docker exec -it [container_id|container_name] bash`. Проверка, что файлы успешно скопировались:
![image-id-24][]

3.6 Обновление контейнера `apt-get update`. Установка gcc, spawn-dcgi, libfcgi-dev `apt-get install -y gcc spawn-fcgi libfcgi-dev`:
![image-id-25][]

3.7 Компиляция `gcc server.c -lfcgi -o server` и запуск нашего сервера `spawn-fcgi -p 8080 ./server`:
![image-id-26][]

3.8 Перезагрузка контейнера `nginx -s reload` выходим из root `exit` и проверка страницы в браузере `curl localhost:81`:
![image-id-27][]

## Part 4. Свой докер.

**Создаем папку в src `mkdir server-4`, внутри server-3 создаем папку `mkdir nginx`, внутри папки nginx создаем конфигурационный файл `touch nginx.conf`**

4.1 Создание докер образа в server-4 `touch Dockerfile` прописываем внутри созданного файла:

    FROM nginx
    USER root
    COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
    COPY ./server.c /home/server.c
    COPY ./start.sh /home/start.sh
    RUN apt-get update; \
        apt-get install -y gcc spawn-fcgi libfcgi-dev
    WORKDIR /home/
    ENTRYPOINT ["sh", "./start.sh"]
![image-id-28][]

4.2 Запуск скрипта из докера для этого создайте скриптовый файл в server-4 `touch start.sh`:

    #!/bin/bash
    gcc server.c -lfcgi -o server
    spawn-fcgi -p 8080 ./server
    service nginx start
    /bin/bash
![image-id-29][]

4.3 Сбор написанного образа `docker build -t test:new .`.
Проверка на корректность сборки `docker images`.
Маппинг 81 порта на 80 `docker run -it --name container -p 80:81 -d test:new`.
Проверка доступа стронички командной `curl localhost:80`:
![image-id-30][]

4.4 Добавление в файл nginx.conf проксирование странички /status:

    user  nginx;
    worker_processes  auto;

    error_log  /var/log/nginx/error.log notice;
    pid        /var/run/nginx.pid;


    events {
        worker_connections  1024;
    }


    http {
        server {
            listen 81;
            listen [::]:81;

            location / {
                fastcgi_pass 127.0.0.1:8080;
            }
            location /status {
                stub_status on;
            }
        }

        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                        '$status $body_bytes_sent "$http_referer" '
                        '"$http_user_agent" "$http_x_forwarded_for"';

        access_log  /var/log/nginx/access.log  main;

        sendfile        on;

        keepalive_timeout  65;
    }
![image-id-31][]

4.5 Вход в контейнер **(как в пункте 3.5)** для перезапуска `docker exec -it [container_id|container_name] bash`.
Перезапускаем командой `nginx -s reload` выходим из root `exit`.
Проверка страницы в браузере `curl localhost:80/status`:
![image-id-32][]

## Part 5. Dockle.

**Инструкция по установке: https://github.com/goodwithtech/dockle#homebrew-mac-os-x--linux-and-wsl**

5.1 Сканирование образа `dockle [container_name]`:
![image-id-33][]

5.2 Проверка на отсутствие ошибок и предупреждений после исправления образа:
![image-id-34][]

## Part 6. Базовый Docker Compose.

6.1 Создаем файл в src директории `touch docker-compose.yml`:

    services:
    server:
        build: ./server-5
    proxy:
        build: ./server-6
        ports:
        - 80:8080
![image-id-35][]

6.2 Делаем сборку `docker-compose build`:
![image-id-36][]

6.3 Pапускаем все контейнеры `docker-compose up`, видим stdout всех контейнеров, а для остановки используем `Ctrl+C`, запуск в режиме демона
`docker-compose up -d`:
![image-id-37][]

6.4 Проверка страницы в браузере `curl localhost:80`:
![image-id-38][]

6.5 Остановка`docker-compose stop`и удаление `docker-compose down`:
![image-id-39][]