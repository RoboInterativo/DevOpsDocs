---
sidebar_position: 3
title: Команды Kubernetes
description: Сборник команд, которые помогут вам работать с Kubernetes.
tags: ["Kubernetes", "Containerization", "DevOps"]
keywords: ["Kubernetes", "Containerization", "DevOps"]
slug: "/kubernetes/commands"
---

## Команды kubectl

- Проверить версию:

```bash
kubectl version
kubectl version --output=yaml
```

- Посмотреть информацию о кластере

```bash
kubectl config view
```

- Запустить под

```bash
kubectl run <pod name> --image <image name>
kubectl run mynginx --image nginx
```

- Создать deployment

```bash
kubectl create deployment <name> --image <image name>
kubectl create deployment mynginx --image nginx
```

- Масштабировать deployment (увеличить количество реплик)

```
kubectl scale deployment <deployment name> --replicas <no of replicas>
kubectl scale deployment mynginx --replicas 2
```

- Посмотреть все запущенные сервисы, поды и т.д.

```bash
kubectl get all
```

- Получить подробности из конкретного пространства имён

```bash
kubectl get all -n <namespace name>
```

- Посмотреть внутренние запущенные компоненты

```bash
kubectl get pods -A
kubectl get pods -A -owide
```

- Посмотреть все запущенные сервисы

```bash
kubectl get services
```

- Посмотреть все запущенные поды

```bash
kubectl get pods
```

```bash
// с дополнительной информацией
kubectl get pods -o wide
```

- Посмотреть все запущенные узлы

```bash
kubectl get nodes
```

- Посмотреть все ReplicaSet

```bash
kubectl get replicaset
```

- Посмотреть все пространства имён

```bash
kubectl get namespaces
```

- Получить все API-ресурсы

```
kubectl api-resources
```

- Удалить deployment

```bash
kubectl delete deployment <deployment-name>
```

- Удалить поды

```bash
kubectl delete pod <pod-name>
```

- Удалить вытесненные поды

```bash
kubectl delete pod --field-selector="status.phase==Failed"
```

- Получить логи пода

```bash
kubectl logs <pod-name>
```

- Открыть оболочку в конкретном контейнере или посмотреть логи в поде с несколькими контейнерами

```bash
kubectl exec -it <pod-name> -c <container-name> -- <bash command>
kubectl exec -it multi-container -c nginx-container -- curl localhost
kubectl exec -it multi-container -c nginx-container -- sh
kubectl logs multi-container -c nginx-container
```

- Попасть внутрь пода

```
kubectl exec -it <pod name> -- sh
kubectl exec -it nginx -- sh
```

- Получить подробное состояние и изменения событий для пода

```bash
kubectl describe pod <pod-name>
```

- Следить за подами (обновление каждые несколько секунд)
```bash
kubectl get pods -w
```

- Посмотреть доступные контексты кластера

```
kubectl config get-contexts
```

- Создать пространство имён можно командой

```bash
kubectl create namespace <name>
kubectl create namespace dev
```

- Выполнить пробный запуск (dry run) и получить результат в YAML

```bash
kubectl create namespace test-name --dry-run=client -oyaml
```

- Отредактировать deployment (файл deployment)

```bash
kubectl edit deployment <deployment name>
```

- Удалить все поды
```
kubectl delete pods --all
```

- Применить к конкретному пространству имён

```bash
kubectl apply -f <config file name> --namespace=<namespace name>
```

## Persistent Volume

- Получить все PersistentVolume

```bash
kubectl get pv
```

- Получить все PersistentVolumeClaim (привязанные к пространству имён)

```bash
kubectl get pvc
```

- Изменить пространство имён по умолчанию или активное

```bash
kubectl config set-context --current --namespace=<namespace name>
```

- Получить подробности конкретного пространства имён

```bash
kubectl get all -n <namespace name>
```

## Что дальше?

- [Введение в Kubernetes](./introduction.md) — повторите концепции подов, deployment и пространств имён.
- [Учебные ресурсы](./learning-resources.md) — продолжайте обучение с курсами, документацией и подробными руководствами.
- [Playground](./playground.md) — попрактикуйтесь в выполнении этих команд в кластере прямо в браузере.
