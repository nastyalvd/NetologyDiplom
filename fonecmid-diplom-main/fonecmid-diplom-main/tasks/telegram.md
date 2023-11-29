# Интеграция с Телеграм

## Документация

Документация по интеграции с Телеграм опубликована по [ссылке](https://core.telegram.org/bots/api). Инструкция ниже сформирована на основании этой документации.

## Подготовка

### Создание бота

1. Напишете в Телеграм [https://t.me/BotFather](BotFather) команду "/start"
2. Напишите команду "/newbot"
3. Выберите имя вашего бота, которое будут видеть пользователи
4. Выберите идентификатор вашего бота (он должен заканчиваться на "bot")
5. Скопируйте токен, который пришлет BotFather и сохраните его в константу

### Создание группы

1. Создайте группу в Телеграм
2. Добавьте в группу только что созданного бота
3. Назначьте боту права администратора

### Получите идентификатор группы

1. Напишите любое сообщение в группу
2. С помощью браузера или Postman выполните запрос `https://api.telegram.org/bot[ВашТокен]/getUpdates`. В полученном JSON найдите идентификатор группы, в которой получено сообщение, и сохраните его в константу.

## Отправка сообщений

1. Создайте общий модуль "Телеграм"
2. В модуле реализуйте метод, который получает на вход текст сообщения
3. В рамках метода:
    - создайте защищённое соединение с сервером "api.telegram.org"
    - создайте HTTP-запрос к ресурсу `/bot[ВашТокен]/sendMessage`
    - добавьте заголовок "Content-Type" со значением "application/json"
    - подготовьте структуру с полями:
        - "chat_id" - идентификатор группы из константы,
        - "text" - текст сообщения
    - установите JSON строку, полученную из структуры, в качестве тела HTTP-запроса
    - отправьте запрос с помощью метода "POST"
    - проверьте, что получет ответ с кодом состояния 200, если код состояния отличный от 200, получите тело ответа как строку и запишите в журнал регистрации информацию об ошибке.

*Пример реализации телеграм-бота подробнее можно посмотреть в [видео](https://www.youtube.com/live/peZsik57m4k?feature=share)*
