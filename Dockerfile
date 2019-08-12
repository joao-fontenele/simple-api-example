FROM node:10.16-alpine

# this is user comes free with the node alpine image
USER node

ENV HOME /home/node
ENV CODE $HOME/code

RUN \
  mkdir $HOME/.node \
  && mkdir -p $CODE

WORKDIR $CODE

CMD ["npm", "start"]
