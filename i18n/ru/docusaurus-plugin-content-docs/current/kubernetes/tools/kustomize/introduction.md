---
title: Введение в Kustomize
sidebar_position: 1
description: Сборник ресурсов для изучения Kustomize.
tags: ["Kustomize", "Kubernetes", "DevOps"]
keywords: ["Kustomize", "Kubernetes", "DevOps"]
slug: "/kubernetes/tools/kustomize"
---

Kustomize — это инструмент, который позволяет настраивать исходные YAML-файлы без шаблонов для разных целей, оставляя оригинальный YAML нетронутым и пригодным для использования как есть.

Kustomize использует `apiVersion`, `kind`, `name` и `namespace` для идентификации ресурсов. Он добавляет суффикс к полям name и namespace, чтобы различать разные версии одного и того же ресурса.

## Ресурсы
