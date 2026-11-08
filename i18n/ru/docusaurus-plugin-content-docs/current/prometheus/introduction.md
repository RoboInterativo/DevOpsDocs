---
sidebar_position: 1
title: Введение в Prometheus
description: Подборка ресурсов для изучения Prometheus.
tags: ["Prometheus", "Monitoring", "Alerting", "Kubernetes"]
keywords: ["Prometheus", "Monitoring", "Alerting", "Kubernetes"]
slug: "/prometheus"
---

Prometheus — это опенсорсный инструментарий для мониторинга и оповещения. Он широко используется для сбора метрик, их запроса во времени и запуска оповещений, когда системы ведут себя неожиданно.

### Установка с помощью Helm

Один из распространённых способов установки Prometheus в Kubernetes — это использование Helm-чарта `kube-prometheus-stack`. Он включает Prometheus вместе со смежными компонентами, такими как Grafana, Alertmanager, Node Exporter и kube-state-metrics.


Шаг 1: Создайте пространство имён Kubernetes

```bash
kubectl create namespace monitoring
```
Шаг 2: Установите Prometheus Operator

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
```
Шаг 3: Получите доступ через localhost с помощью переадресации портов

```bash
kubectl port-forward svc/prometheus-grafana 3000:80 -n monitoring
```

> Панель Grafana будет доступна по адресу `http://localhost:3000`. Имя пользователя по умолчанию — `admin`. Исходный пароль обычно берётся из конфигурации чарта или из сгенерированного секрета Kubernetes, в зависимости от устанавливаемой версии.


### Что дальше?

- [Обучающие материалы](./learning-resources.md) — узнайте больше о Prometheus с помощью этих ресурсов.