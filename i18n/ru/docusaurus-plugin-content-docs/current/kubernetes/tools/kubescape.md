---
title: Kubescape
sidebar_position: 2
description: Инструмент, который помогает проверять кластеры Kubernetes на наличие проблем безопасности и неправильных конфигураций.
tags: [Kubernetes, Tools, Security]
keywords: [Kubernetes, Tools, Security, Kubescape]
slug: /kubernetes/tools/kubescape
---


Kubescape — это инструмент, который помогает проверять кластеры Kubernetes на наличие неправильных конфигураций безопасности. Мы можем сканировать локальный кластер и файлы конфигурации.

- [Сайт](https://armosec.io/kubescape)
- [Документация](https://hub.armosec.io/docs)
- [GitHub](https://github.com/kubescape/kubescape)

### Использование

Больше примеров использования смотрите на [GitHub](https://github.com/kubescape/kubescape)

- Установка Kubescape

Инструкции по установке можно найти [здесь](https://github.com/kubescape/kubescape#install-on-macos)

- Сканирование локальных YAML/JSON-файлов.

```bash
kubescape scan *.yaml
```

- Сканирование манифестов Kubernetes из git-репозитория

```bash
kubescape scan https://github.com/kubescape/kubescape
```

- Результаты можно выводить в форматах JSON, HTML и markdown PDF.

```bash
kubescape scan *.yaml --output results.json
kubescape scan *.yaml --output results.pdf
kubescape scan *.yaml --output results.html
```
