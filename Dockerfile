FROM ruby:2.7.6

WORKDIR /solomeal

RUN apt-get update \
  && apt-get install -y \
    nodejs \
    yarn \
    imagemagick \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

COPY Gemfile /solomeal//Gemfile
COPY Gemfile.lock /solomeal//Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
