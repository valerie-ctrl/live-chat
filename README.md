# README для Live Chat на Rails
## Инструкции
### 1. Клонировать Репозиторий
git clone https://github.com/your-username/your-repo.git cd your-repo`

### 2. Сбор Docker-Контейнеров и Запуск Тестов

`docker build -t live-chat .`

#### b. Запуск Тестов
`docker run --rm live-chat bundle exec rspec`

### 3. Запуск Docker-Контейнера

`docker run -p 3500:3500 live-chat`

### 4. Открыть Приложение

 http://localhost:3500
