FROM ruby:3.0.0

RUN mkdir /url_shortener

WORKDIR /url_shortener

ADD url_shortener/Gemfile /url_shortener/Gemfile

ADD url_shortener/Gemfile.lock /url_shortener/Gemfile.lock

RUN gem update --system

RUN bundle install 


