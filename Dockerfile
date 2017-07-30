FROM ruby:2.1

WORKDIR /src
ADD Gemfile /src
ADD Gemfile.lock /src
RUN gem install bundler
RUN bundle install

VOLUME /src
EXPOSE 4000
ENTRYPOINT [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0" ]
