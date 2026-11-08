---
sidebar_position: 1
title: Введение в Helm
description: Узнайте о Helm и его преимуществах.
tags: ["Helm", "Kubernetes", "Package Manager"]
keywords: ["Helm", "Kubernetes", "Package Manager"]
slug: "/helm"
---

Helm — это менеджер пакетов и инструмент шаблонизации для Kubernetes. Он помогает определять, устанавливать, обновлять и управлять приложениями Kubernetes с помощью переиспользуемых чартов. Часто Helm сравнивают с `apt`, `yum` или `brew`, но только для приложений Kubernetes.

Основной сценарий его использования — развертывание приложений и управление конфигурацией, специфичной для конкретной среды.

## Архитектура Helm

Архитектура Helm 3 проще, чем у Helm 2. Серверный компонент под названием Tiller был удалён, поэтому теперь Helm работает как клиентское приложение, которое напрямую взаимодействует с сервером API Kubernetes.

### Использование Helm-чарта

Чтобы развернуть приложение с помощью Helm, нужно создать Helm-чарт. Helm-чарт — это набор файлов, описывающий связанный набор ресурсов Kubernetes. Один чарт можно использовать для развертывания чего-то простого, например пода с memcached, или чего-то сложного, например полного стека веб-приложения с HTTP-серверами, базами данных, кешами и так далее.

Сначала добавьте репозиторий чартов:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

- Обновите локальный индекс репозитория:

```bash
helm repo update
```

- Установите чарт:

```bash
helm install postgres bitnami/postgresql
```

Поиск доступных чартов:

```bash
helm search repo bitnami
```

Поиск доступных версий чарта:

```bash
helm search repo bitnami/postgresql --versions
```

Вы также можете скачать чарт локально, чтобы изучить его файлы. Флаг `--version` относится к версии чарта, а не к версии приложения.

```bash
helm pull bitnami/postgresql --version 16.3.0
```

Вы можете передать чарту собственные значения с помощью файла значений:

```bash
helm install postgresql bitnami/postgresql --values values.yaml
```

Например, файл `values.yaml` может выглядеть так:

```yaml
commonAnnotations:
    foo: bar
```

Мы можем обновить чарт с помощью следующей команды:

```bash
helm upgrade --install postgresql bitnami/postgresql --values values.yaml --version=16.4.0 --namespace=my-namespace
```

Вы можете откатить чарт с помощью следующей команды. Здесь `postgresql` — это имя релиза, которое можно получить из вывода `helm list`.

```bash
helm rollback postgresql
```

Чтобы проверить релизы Helm:

```bash
helm list
```

Чтобы проверить значения, предоставленные пользователем. Снова `postgresql` — это имя релиза:

```bash
helm get values postgresql
```

Вы также можете просмотреть отрендеренные манифесты Kubernetes, сгенерированные чартом. Снова `postgresql` — это имя релиза:

```bash
helm get manifest postgresql
```

Вы можете удалить чарт с помощью следующей команды. Снова `postgresql` — это имя релиза:

```bash
helm uninstall postgresql
```

### Создание собственного Helm-чарта

- Вы можете создать собственный Helm-чарт с помощью следующей команды. Она создаёт каталог с шаблонными файлами.

```bash
helm create mychart
```

- Вы можете установить чарт с помощью следующей команды. `mychart` — это имя релиза, а `./mychart` — путь к чарту.

```bash
helm install mychart ./mychart
```

Мы также можем применить чарт с файлом значений:

```bash
helm install mychart ./mychart --values values.yaml
```

## Хуки Helm

Хуки Helm — это способ взаимодействия с жизненным циклом релиза. Они позволяют вмешиваться в определённые моменты жизненного цикла релиза. Helm поддерживает следующие хуки:

- `pre-install` — запускается до того, как будут отрендерены какие-либо шаблоны.
- `post-install` — запускается после того, как все шаблоны были отрендерены и ресурсы созданы.

### Что дальше?

- [Учебные ресурсы](./learning-resources.md) — узнайте больше о Helm с помощью этих ресурсов.
