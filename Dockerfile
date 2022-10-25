FROM ruby:2.7.6

WORKDIR /eatcapsule

RUN apt-get update \
  && apt-get install -y \
    nodejs \
    yarn \
  #イメージファイルの容量を減らす
  && rm -rf /var/lib/apt/lists/*
