FROM node:20

RUN corepack enable
RUN corepack prepare yarn@stable --activate

WORKDIR /app

COPY package.json yarn.lock .yarnrc.yml nest-cli.json tsconfig.json ./

COPY apps apps
COPY libs libs

RUN yarn config set nodeLinker node-modules
RUN yarn install --immutable

RUN yarn workspace @apps/booking-service run build

CMD ["yarn", "start:booking-service:prod"]
