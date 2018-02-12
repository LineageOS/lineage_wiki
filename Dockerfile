FROM ruby:2.4

WORKDIR /src
ADD . /src
RUN gem install bundler
RUN bundle install

EXPOSE 4000
ENTRYPOINT [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0" ]
