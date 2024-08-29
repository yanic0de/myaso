# Указываем базовый образ
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем исходный код
COPY . .

# Добавляем переменные окружения, если они нужны
# ENV NEXT_PUBLIC_API_URL=https://api.example.com

# Собираем проект Next.js
RUN npm run build

# Открываем порт для приложения
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"]