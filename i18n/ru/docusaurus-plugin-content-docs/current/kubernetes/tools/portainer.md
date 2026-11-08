---
title: Portainer
sidebar_position: 3
description: Сборник ресурсов для изучения Portainer.
tags: ["Portainer", "Kubernetes", "Docker", "Containerization"]
keywords: ["Portainer", "Kubernetes", "Docker", "Containerization"]
slug: "/kubernetes/tools/portainer"
---



### Ресурсы

- [Portainer](https://www.portainer.io/)
- [Документация Portainer](https://documentation.portainer.io/)
- [Portainer на GitHub](https://github.com/portainer/portainer)

### Установка

С помощью Helm

- Создайте пространство имён для Portainer

```bash
kubectl create namespace portainer
```

-  Добавьте Helm-репозиторий Portainer

```bash
helm repo add portainer https://portainer.github.io/k8s
```

- Установите Helm-чарт Portainer

```bash
helm update
helm install -n portainer portainer portainer/portainer 
```

> Для установки бизнес-редакции используйте следующую команду

```bash
helm install --create-namespace -n portainer portainer portainer/portainer \
    --set enterpriseEdition.enabled=true \
    --set tls.force=true
```

- Чтобы открыть панель управления Portainer, выполните следующую команду

```bash
kubectl -n portainer port-forward svc/portainer 9000:9000
```

Панель управления будет доступна по адресу http://localhost:9000.

- Для бизнес-редакции следуйте этому [руководству](https://install.portainer.io/).
