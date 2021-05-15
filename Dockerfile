FROM ruby:2.7.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/demo
WORKDIR /usr/src/demo
ADD Gemfile /usr/src/demo/Gemfile
ADD Gemfile.lock /usr/src/demo/Gemfile.lock
RUN bundle install
ADD . /usr/src/demo
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace