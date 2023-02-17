FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y \
  postgresql-client \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  libffi-dev \
  libc-dev \
  file \
  imagemagick \
  git \
  tzdata \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

RUN gem cleanup
RUN gem cleanup administrate
ENV BUNDLE_PATH /gems
RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
