FROM ruby:3.1.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
WORKDIR /parts-sync
COPY Gemfile /parts-sync/Gemfile
COPY Gemfile.lock /parts-sync/Gemfile.lock
RUN bundle install
COPY . /parts-sync
