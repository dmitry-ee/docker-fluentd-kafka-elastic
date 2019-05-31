### BASE IMAGE ###
FROM      fluent/fluentd:v1.4-1 as builder

USER      root

COPY      Gemfile /Gemfile

RUN       set -ex ;\
          apk add --no-cache --update --virtual .build-deps \
            build-base ruby-dev ;\
          gem install bundler ;\
          bundle install --no-cache --gemfile=/Gemfile ;\
          gem sources --clear-all ;\
          apk del .build-deps ;\
          rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

USER fluent
