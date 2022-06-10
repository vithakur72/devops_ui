FROM node:14-alpine
WORKDIR /usr/app
#install some dependencies
COPY ./ ./
RUN npm install
EXPOSE 8080
#default command
CMD ["npm","start"]