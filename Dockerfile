FROM ruby:2.5.0-alpine

RUN apk add --no-cache \
      build-base \
      curl \
      git \
      postgresql-dev \
      tzdata \
      less \
      jq \
      nodejs \
      yarn \
      imagemagick

ENV APP_HOME /mechhead
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle install

COPY . $APP_HOME
