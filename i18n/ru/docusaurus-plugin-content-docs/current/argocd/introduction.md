---
sidebar_position: 1
title: ArgoCD Introduction
description: A deep dive into ArgoCD, a declarative, GitOps continuous delivery tool for Kubernetes.
tags: ["ArgoCD", "GitOps", "Kubernetes", "Continuous Delivery"]
keywords: ["ArgoCD", "GitOps", "Kubernetes", "Continuous Delivery"]
slug: "/argocd"
---

Argo CD — это GitOps-контроллер для Kubernetes. Он отслеживает Git-репозиторий, сравнивает желаемое состояние с текущим состоянием кластера и помогает поддерживать их синхронизацию. Обычно он используется для развёртывания приложений и декларативного управления конфигурацией кластера.

> Одна из главных идей GitOps проста: храните желаемое состояние в Git.

- Для продакшена можно использовать такие инструменты, как [Autopilot](https://github.com/argoproj-labs/argocd-autopilot), устанавливать из официального каталога манифестов [manifest directory](https://github.com/argoproj/argo-cd/tree/master/manifests) или использовать community-Helm-чарт [Helm chart](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd).

<p align="center"><img width="1014" alt="Screenshot 2022-11-29 at 11 44 57 PM" src="https://user-images.githubusercontent.com/51878265/204613004-e5dace25-7502-487d-acea-86d63c70cc2a.png"></img></p>

### Установка

- Установите, применив манифесты. Ссылка: [Argo CD Installation](https://argoproj.github.io/argo-cd/getting_started/#1-install-argo-cd)

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Учётные данные по умолчанию:

- Username (Имя пользователя): admin
- Password (Пароль): его можно получить, выполнив следующую команду

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Политика синхронизации — возможности

<p align="center"><img width="820" alt="Screenshot 2022-11-30 at 4 56 41 PM" src="https://user-images.githubusercontent.com/51878265/204785046-93eb5b20-31b6-4f2b-b2a4-223f88f18718.png"></img></p>

- **Auto Sync (автосинхронизация)** — Argo CD автоматически синхронизирует приложение с Git-репозиторием.

- **Self Healing (самовосстановление)** — если кто-то изменит ресурсы напрямую в кластере, Argo CD может откатить их, чтобы текущее состояние снова соответствовало Git.

- **Auto Pruning (автоочистка)** — Argo CD может автоматически удалять ресурсы, которые больше не определены в Git.

## Progressive Delivery (постепенная доставка)

Progressive Delivery — это практика развёртывания приложения постепенно, что позволяет минимизировать простой и упростить откаты. Существует несколько форм постепенной доставки, таких как blue/green, canary, a/b и feature flags.

- **Blue/Green** — разверните новую версию приложения в новом окружении, а затем переключите трафик на новое окружение. Это наиболее распространённая форма постепенной доставки. Она также наиболее сложна в реализации. Требует много инфраструктуры и много тестирования.

- **Canary** — разверните новую версию приложения для небольшой части пользователей. Если новая версия работает нормально, разверните её для остальных пользователей. Это наиболее распространённая форма постепенной доставки. Она также наиболее сложна в реализации. Требует много инфраструктуры и много тестирования.

- Чтобы вся конфигурация оставалась декларативной, мы можем определять приложения Argo CD так же, как любой другой ресурс Kubernetes, и хранить их в Git.

[Документация](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/) для справки.

Пример YAML:

```YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: nginx-app # This is the name of the application
  namespace: argocd
spec:
    destination:
        namespace: argocd # This is the namespace where the application will be deployed
        server: https://kubernetes.default.svc # This is the default server
    project: default
    source:
        path: ./manifest # This is the path where the manifest is present
        repoURL: https://github.com/sarafpradumna/argo-test # This is the repo where the manifest is present
        targetRevision: HEAD
    syncPolicy:
        automated:
            prune: true
            selfHeal: true
            allowEmpty: false #By default it is false
        syncOptions:
        - CreateNamespace=true # This will create namespace if not present
```

### Что дальше?

- [Список обучающих ресурсов](learning-resources.md) — узнайте больше об ArgoCD с помощью этих ресурсов.
- [Другие ресурсы](other-resources.md) — изучите больше об ArgoCD с помощью этих ресурсов.
