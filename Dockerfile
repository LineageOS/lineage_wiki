FROM ruby:2.4

# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /src
ADD Gemfile /src
ADD Gemfile.lock /src
RUN gem install bundler
RUN bundle install

VOLUME /src
EXPOSE 4000
ENTRYPOINT bundle exec ruby test/validate.rb && bundle exec jekyll serve --host 0.0.0.0 --incremental
