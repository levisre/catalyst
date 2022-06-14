FROM node:14

WORKDIR /app/ui

CMD yarn --ignore-engines install && yarn serve