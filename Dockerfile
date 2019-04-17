### BASE IMAGE ###
FROM      ruby:2.5.5 as builder

RUN       mkdir /install
WORKDIR   /install

COPY      Gemfile /Gemfile.lock
RUN       set -ex ;\
          apt-get update ;\
          apt-get install -y build-essential libpq-dev ;\
          gem install bundler
RUN       bundle install --path=/install --gemfile=/Gemfile.lock

### IMAGE ###
FROM      fluent/fluentd:v1.4-1
COPY      --from=builder /install /usr/local
