## Многосервисное приложение

Это простое многосервисное приложение, состоящее из React-клиента, Node API и Golang API. Приложение использует базу данных PostgreSQL для хранения данных.

### Предварительные требования

- Кластер Kubernetes
- Helm v3
- kubectl

## Структура

Ниже показана структура этого каталога:

```markdown
├── api-golang
│   ├── Deployment.yaml
│   ├── IngressRoute.yaml
│   ├── Secret.yml
│   └── Service.yaml
├── api-node
│   ├── Deployment.yaml
│   ├── IngressRoute.yaml
│   ├── Secret.yaml
│   └── Service.yaml
├── client-react
│   ├── ConfigMap.yaml
│   ├── Deployment.yaml
│   ├── IngressRoute.yaml
│   └── Service.yaml
├── common
│   ├── Middleware.yaml
│   ├── Namespace.yaml
└── postgresql
    ├── Job.db-migrator.yaml
    └── Secret.db-password.yaml
```

### Настройка приложения

Убедитесь, что вы находитесь в каталоге `go-node-react-postgres`.

1. Создайте пространство имён

```bash
kubectl apply -f Namespace.yaml
```

Переключитесь на это пространство имён:

```bash
kubectl config set-context --current --namespace=demo-app
```

2. Установите базу данных PostgreSQL с помощью Helm

Добавьте репозиторий bitnami:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

Установите чарт:

```bash
helm upgrade --install \
    -n postgres \
    postgres bitnami/postgresql \
    --set auth.postgresPassword=foobarbaz \
    --version 15.3.2 \
    --values ./postgresql/values.yaml \
    --create-namespace
```

3. Миграция базы данных

Сначала нужно создать секрет для пароля базы данных:

```bash
kubectl apply -f postgresql/Secret.db-password.yaml
```

Затем можно запустить job миграции:

```bash
kubectl apply -f postgresql/Job.db-migrator.yaml
```

5. Установите Ingress Controller для трафика

Добавьте репозиторий traefik:

```bash
helm repo add traefik https://traefik.github.io/charts
```

Установите чарт:

```bash
helm upgrade --install \
    -n traefik \
    traefik traefik/traefik \
    --version 20.8.0 \
    --create-namespace
```

6. Разверните Middleware для удаления префикса из входящих запросов

```bash
kubectl apply -f common/Middleware.yaml
```

7. Разверните Golang API.

Перед развертыванием обновите файл `IngressRoute.yaml`, указав правильный хост.

```yaml
routes:
    - kind: Rule
      match: Host(`host/domain`) && PathPrefix(`/api/golang`)
```

Затем разверните API:

```bash
kubectl apply -f api-golang
```

8. Разверните Node API.

Перед развертыванием обновите файл `IngressRoute.yaml`, указав правильный хост.

```yaml
routes:
    - kind: Rule
      match: Host(`host/domain`) && PathPrefix(`/api/node`)
```

Затем разверните API:

```bash
kubectl apply -f api-node
```

9. Разверните React-клиент.

Перед развертыванием обновите файл `IngressRoute.yaml`, указав правильный хост.

```yaml
routes:
    - kind: Rule
      match: Host(`host/domain`) # This will root with no prefix
```

Затем разверните клиент:

```bash
kubectl apply -f client-react
```

Теперь вы должны иметь возможность открыть приложение по хосту/домену, указанному в файлах IngressRoute.

- Для Node API используйте `<host>/api/node`.
- Для Golang API используйте `<host>/api/golang`.
- Для React-клиента используйте `<host>`.
