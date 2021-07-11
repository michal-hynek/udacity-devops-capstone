FROM node:16.4.2

WORKDIR /app
ENV PORT=8000

COPY .eslintrc .eslintignore index.html package.json package-lock.json serve.js /app/
COPY src/ /app/src/

RUN npm install && npm run build

EXPOSE 8000

CMD ["npm", "start"]