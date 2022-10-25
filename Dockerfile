FROM ruby:2.7.6

WORKDIR /eatcapsule

RUN apt-get update \
  && apt-get install -y \
    nodejs \
    yarn 
