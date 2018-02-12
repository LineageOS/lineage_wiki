FROM ruby:2.4

WORKDIR /src
ADD . /src
RUN gem install bundler
RUN bundle install

RUN bundle exec ruby test/validate.rb

VOLUME /src
EXPOSE 4000
ENTRYPOINT ["/bin/bash"]
CMD bundle exec ruby test/validate.rb && bundle exec jekyll serve --host 0.0.0.0
