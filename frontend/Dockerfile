FROM node:17.9.0-slim

LABEL version="1.0"
LABEL description="Frontend app Docker image"

RUN useradd userui

WORKDIR /app

RUN chown userui /app /home

COPY . .

RUN npm install 

EXPOSE 3000

USER userui

CMD ["npm","start"]
