---
sidebar_position: 3
title: Docker Команды
description: Набор команд Docker, которые помогут вам начать работу с Docker.
tags: ["Docker", "Containerization", "DevOps"]
keywords: ["Docker", "Containerization", "DevOps"]
slug: "/docker/commands"
---

### Основы Docker

- Проверка версии Docker

```bash
docker version
```

- Просмотр всех доступных образов

```bash
docker images test
```

- Загрузить образ из реестра на локальную машину.

```bash
docker pull <image name>
//Пример: docker pull nginx
```

- Запуск контейнера (если образа нет локально, он сначала будет загружен)
  - ПРИМЕЧАНИЕ: если указать только имя образа, будет загружена последняя версия, то есть `nginx:latest`. Также можно указать конкретную версию, например `nginx:1.14`
  - Дополнительно можно использовать флаги

     - `--name <name> `- задать имя контейнера.
     - `-p <Host port:container port>`- пробросить порт.
     - `-d` - запуск в фоновом режиме (detached mode)
     - `-it` - для интерактивного окружения
     - `-e` - для переменной окружения

```bash
docker run <image-name>
//Пример: docker run nginx
```

- Также можно передать целый файл `.env`

```bash
--env-file <path-to-env-file>
Пример: --env-file ./.env
```

### Контейнер Docker

- Остановить запущенный контейнер

```bash
docker stop <container-ID/name>
```

- Возобновить остановленный контейнер

```bash
docker start <container-ID/name>
```

- Проверить процессы, выполняющиеся внутри контейнера.

```bash
docker top <container-name/id>
```

- Проверить статистику запущенного контейнера.

```bash
docker stats <container-name/id>
```

- Посмотреть конфигурацию и информацию о контейнере.

```bash
docker inspect <container-name/id>
//Пример: docker inspect mynginx
```

- Посмотреть все запущенные контейнеры.

```bash
docker ps
или
docker container ls
```

- Запустить интерактивную сессию и подключить терминал к контейнеру.

  - ПРИМЕЧАНИЕ: не каждый образ поддерживает `bash`, поэтому следует использовать `sh`

```
docker exec -it <container-ID/name> bash/sh
```

- Проверить, какие порты открыты и проброшены

```bash
docker port <image-name>
```

- Посмотреть все контейнеры (остановленные, приостановленные и запущенные)

```bash
docker ps -a
```

- Посмотреть логи контейнера

```bash
docker logs <container-ID/name>
```

- Удалить все остановленные контейнеры

```bash
docker container prune -f
```

- Удалить все контейнеры (остановленные, приостановленные и запущенные)
```bash
docker rm -f $(docker ps -aq)
```
- Удалить все образы
```bash
docker rmi -f $(docker images -q)
```

- Удалить неиспользуемые образы
```bash
docker image prune -all
```

- Автоматическая очистка при завершении контейнера

```bash
 docker container run —rm <image-name>
```

### Сети Docker

- Посмотреть список доступных сетей.

```bash
docker network ls
```

- Просмотреть компоненты сети, например какие контейнеры к ней подключены.

```bash
docker network inspect <network-name>
```

- Запустить контейнер в определённой сети / собственной созданной сети

```
docker run --network <network-name> <image-name>
```

```
docker inspect --format "{{.NetworkSettings.IPAddress}}" <container-name>
```

### Образы Docker

- Удалить образ

```bash
docker rmi <image name> -f
```

- Удалить все образы сразу

```bash
docker rmi $(docker images -q)
```

- Просмотреть слои образа и другую информацию

```bash
docker inspect  <image-name/id>
```

- Посмотреть формирование слоёв образа

```bash
docker history <image-name/id>
```

- Создать собственный образ с тегом на основе существующего образа.

```
docker image tag <image-name:tag> <new-image-name:tag>
docker image tag nginx pradumna/nginx:hello
docker image tag ubuntu:18.04 pradumna/ubuntu:example
```

### Тома Docker

- Создать bind mount
  - Помогает синхронизировать локальные файлы с помощью контейнера Docker.


- Синхронизировать локальные изменения с контейнером с помощью bind mount.
    - `-v` используется для определения монтирования. При необходимости можно смонтировать второй путь в режиме только для чтения.

```bash
docker run -v <path-to-folder-on-local-machine>:<path-to-folder-on-container> -p <host-port>:<container-port> -d --name docker-node docker-node
docker
```

```bash
docker run -v <path-to-folder-on-local-machine>:<path-to-folder-on-container> -v <path-to-file/folder-on-container> -p <local-machine-port>:<container-port> -d --name docker-node docker-node
```
Чтобы сделать монтирование доступным только для чтения, добавьте `:ro` в конец определения монтирования.

- Команда docker volume для монтирования docker-сокета в контейнер, чтобы получить доступ к демону Docker хоста и выполнять непрерывную интеграцию в Jenkins, используя Docker в качестве агента..
```bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock docker-image:version bin/bash
```

### Docker Compose

- Запустить проект Docker Compose.
  Примечание: если не передать `-f`, Docker ищет `compose.yaml` или `docker-compose.yaml` в рабочем каталоге.

```bash
docker compose up -d
```

```bash
docker compose down
```

- Пересобрать образ с новыми изменениями.

```bash
docker compose up --build
```

- Объединить несколько файлов Compose.

```bash
docker compose -f compose.yaml -f compose.dev.yaml
```

### Docker Swarm и сервисы

- Инициализировать Swarm

```bash
docker swarm init
```

- Посмотреть все доступные узлы

```bash
docker node ls
```

- Добавить узел в качестве менеджера

```bash
docker node update --role manager <node-name>
```

- Создать overlay-сеть

```bash
docker network create -d overlay backend
```

- Создать сервис. Также можно добавить флаги для дополнительной настройки.

    - `--name` - задать имя сервиса
    - `--replicas` - определить, сколько запущенных экземпляров одного образа.
    - `-p` - для проброса портов

```bash
docker service create -p 8080:80 --name vote --replicas 2 nginx
```

- Получить все контейнеры задач, работающие на разных узлах

```bash
docker service ps <service-name/id>
```

> ОБНОВЛЕНИЕ СЕРВИСА

- Масштабировать сервис (то есть увеличить количество реплик)

```bash
docker service scale <service name>=<no to scale>
docker service scale mynginx=5
```

- Обновить образ в запущенном сервисе

```bash
docker service update --image <updated image> <service name>
docker service update --image mynginx:1.13.6  web
```

- Обновить порт

Обновить порт напрямую нельзя — нужно добавить и удалить порты

```
docker service update --publish-rm 8080 --publish-add 808180 <service name>
docker service update --publish-rm 8080 --publish-add 808180 mynginx
```

### Стек Docker

- Развернуть файл стека

```bash
docker stack deploy -c <file-name.yaml> <stackname>
```

- Удалить запущенный стек

```
docker stack rm <stack name>
```

- Посмотреть список запущенных стеков

```
docker stack ls
```

**СТЕК -> СЕРВИСЫ -> ЗАДАЧИ -> КОНТЕЙНЕРЫ**

- Проверить, какие сервисы работают внутри стека

```
docker stack services <stack name>
```

- Проверить, какие задачи работают внутри стека

```
docker stack ps <stack name>
```

> Реестр

```
127.0.0.0:5000/v2/_catalog
```

### Советы и сокращения

- Выполнить команду при создании контейнера

```bash
docker run <image-name> <command>
// Пример: `docker run ubuntu:16.04 echo hey`
```


- Создание собственного образа и контейнера.

```
Шаг 1 — создайте Dockerfile
Шаг 2 — docker build -t myimage:1.0 <path-of-dockerfile> (-t для тега)
Шаг 3 — docker run myimage:1.0
```

## Что читать дальше

- [Введение в Docker](./introduction.md) — повторите основные концепции Docker, лежащие в основе этих команд.
- [Обучающие ресурсы](./learning-resources.md) — продолжите обучение на курсах и видео для более глубокой практики.
- [Другие ресурсы](./other-resources.md) — изучите примеры Dockerfile и файлов Compose.
