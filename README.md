# Live Chat на Rails
## Инструкции
### 1. Сбор Docker-Контейнеров и Запуск Тестов
`docker build -t live-chat .`

#### Запуск Тестов
`docker run --rm live-chat bundle exec rspec`

### 2. Запуск Docker-Контейнера
`docker run -p 3500:3500 live-chat`

### 3. Открыть Приложение
 http://localhost:3500
