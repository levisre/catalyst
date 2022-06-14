# FROM node:18
# COPY ui .
# RUN yarn --ignore-engines install
# RUN yarn build



FROM golang:1.18
# COPY . /app
# COPY --from=0 dist ui/dist
WORKDIR /app/.devcontainer
CMD bash start_dev_with_keycloak.sh



# FROM ubuntu:18.04
# 
# RUN apt-get update -y && apt-get -y install curl gnupg2 software-properties-common
# RUN curl -OL https://download.arangodb.com/arangodb39/DEBIAN/Release.key
# RUN apt-key add Release.key
# RUN apt-add-repository 'deb https://download.arangodb.com/arangodb39/DEBIAN/ /'
# RUN apt-get update -y && apt-get -y install arangodb3
# 
# COPY --from=1 catalyst /app/catalyst
# CMD /app/catalyst
# 
# EXPOSE 8000
# 