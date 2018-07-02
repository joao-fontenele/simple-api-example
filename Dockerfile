FROM node:8-alpine

# this is user comes free with the node alpine image
USER node

ENV HOME /home/node
ENV CODE $HOME/code

RUN mkdir -p $HOME/.node

# the purpose of this cmd is to create the code folder and the build folder
# that will be used in the build script run below
RUN mkdir -p $CODE/build

WORKDIR $CODE

COPY . $CODE

# install dependencies and runs build that transpiles code
RUN yarn --pure-lockfile && \
    yarn run build && \
    NODE_ENV=production yarn --production --pure-lockfile && \
    yarn cache clean

CMD ["yarn", "run", "start:production"]
