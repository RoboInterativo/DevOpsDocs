---
sidebar_position: 1
title: YAML Введение
description: Learn about YAML (YAML Ain't Markup Language) and its properties.
tags: ["YAML", "Data Serialization", "Configuration"]
slug: "/yaml"
---

## YAML - YAML это не язык разметки

YAML - это человеко-читабельный язык сериализации данных. Он часто используется для конфигурационных файлов и описания структурированных данных в таких инструментах, как Kubernetes, GitHub Actions и Docker Compose.

Пример:

```yaml
name: Pradumna
age: 21
address:
  city: Bangalore
  state: Karnataka
  country: India
  phone:
    office: 0000000
    home:
        - 1111111
        - 2222222
```

### Свойства

- По своему назначению схож с JSON и XML.
- Предназначен для данных, а не для исполняемых команд.
- Чувствителен к отступам и пробелам.
- Легко читается человеком при чётко оформленных данных.

### Синтаксис

#### Пара - ключ, значение

```yaml
Name: "Pradumna Saraf"
1: "Это значение"
```

#### Список

```yaml
- apple
- mango
- Banana
- banana
```
или

```yaml
cities: [new delhi, patna, gujarat]
```

#### Строки и переменнные

```yaml
name: Pradumna Saraf
fruit: "Mango"
job: 'Advocate'
age: 65
marks: 10.33
booleanValue: false
```

#### Многострочный текст

```yaml
Address: |
  01
  Delhi
  India
```
Сложенный стиль (folded style) объединяет несколько строк в одну строку.

```yaml
message: >
  This all
  will be in a single
  line

```

#### Вложенные отображения

```yaml
names: Pradumna
role:
  age: 22
  job: student
```  

#### Вложенные последовательности

```yaml
-
  - mango
  - apple
  - banana
-
  - marks
  - roll
```

#### Специализированные типы данных

```yaml

# Integer (Целочисленный)
Zero: !!int 0
positiveNumber: !!int 45
negativeNumber: !!int -45
hexa: !!int 0x45

# Float (Дробные, с плавающей запятой)
mark: !!float 56.55
infinity: !!float .inf
not a num: .nan
itNot: !!bool false

# String (Строки)
string: !!str "hello"

# Null (Нулевой тип)
surname: !!null #null or NULL ~
~: this a null key

# Exponential Numbers(Экспонента)
myNum: 6.22E56

# Dates and time (Дата и время)
date: !!timestamp 2002-01-02
no Time zone: 2012-12-15T02:59:43
India Time: 2012-12-15T02:59:43 +5:30
```

### Использование

- Применяется в Kubernetes, Ansible, Docker и многих других инструментах.
- Полезен для хранения данных в виде пар «ключ — значение».
- Часто используется в системах CI/CD, таких как GitHub Actions и CircleCI.

### Что дальше?

- [Список обучающих ресурсов](./learning-resources.md) - Узнать больше о YAML на этих ресурсах.
- [Инструменты](./tools.md) - Узнать больше об инструментах которые используют YAML.
