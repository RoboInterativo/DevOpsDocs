---
title: K9s
sidebar_position: 5
description: K9s — это терминальный интерфейс для взаимодействия с кластерами Kubernetes. Он предоставляет богатый набор возможностей для управления ресурсами Kubernetes.
tags: [Kubernetes, Tools]
keywords: [Kubernetes, Tools, K9s]
slug: /kubernetes/tools/k9s
---

K9s — это терминальный интерфейс для взаимодействия с кластерами Kubernetes. Он предоставляет богатый набор возможностей для управления ресурсами Kubernetes. Он помогает перемещаться по кластерам Kubernetes, просматривать подробности ресурсов и выполнять действия с ресурсами. Очень полезен для отладки и устранения неполадок приложений Kubernetes.

## Ресурсы

- [Репозиторий K9s на GitHub](https://github.com/derailed/k9s)
- [Документация K9s](https://k9scli.io/)

## Установка

Вы можете установить k9s на macOS с помощью Homebrew.

```bash
brew install k9s
```

После установки K9s его можно запустить следующей командой:

```bash
k9s
```
Он покажет ресурсы, запущенные в вашем кластере Kubernetes (для текущего контекста и пространства имён).

![K9s](https://github.com/user-attachments/assets/4d3fefc3-34eb-407d-bae2-3299dd72f88c)
