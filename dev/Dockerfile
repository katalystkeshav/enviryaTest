FROM node:alpine

RUN adduser -D -g 'alpine' alpine

RUN mkdir /opt/app/

COPY index.js /opt/app/ 

RUN chown -R alpine:alpine /opt/app/

WORKDIR /opt/app/

EXPOSE 3000

CMD ["node", "index.js"]








