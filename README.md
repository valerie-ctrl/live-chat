# Live Chat на Rails
## Инструкции
### 1. Сбор Docker-Контейнеров и Запуск Тестов
`docker-compose build`

#### Запуск Тестов
`docker run bundle exec rspec`

### 2. Запуск Docker-Контейнера
`docker-compose build
docker-compose run web rails db:create db:migrate
docker-compose up`

### 3. Открыть Приложение
 http://localhost:3000
