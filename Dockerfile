FROM ruby:3.1.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /parts-sync
WORKDIR /parts-sync
ADD Gemfile /parts-sync/Gemfile
ADD Gemfile.lock /parts-sync/Gemfile.lock
RUN bundle install
ADD . /parts-sync
