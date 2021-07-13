FROM node:14-alpine

ENV NODE_ENV production
ENV PORT 80
EXPOSE 80

WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn && yarn cache clean
COPY . .
RUN yarn build
CMD [ "yarn", "start", "-p", "80" ]
