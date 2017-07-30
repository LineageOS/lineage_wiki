FROM ruby:2.1

WORKDIR /src
ADD Gemfile /src
RUN bundle install

EXPOSE 4000

CMD [ "bundle", "exec", "jekyll", "serve", "--incremental", "--host", "0.0.0.0" ]
