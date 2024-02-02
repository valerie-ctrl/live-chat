# Live Chat на Rails
## Инструкции
### 1. Сбор Docker-Контейнеров и Запуск Тестов
`docker-compose build -t live-chat .`

#### Запуск Тестов
`docker run --rm live-chat bundle exec rspec`

### 2. Запуск Docker-Контейнера
`docker run -p 3000:3000 live-chat`

### 3. Открыть Приложение
 http://localhost:3000
