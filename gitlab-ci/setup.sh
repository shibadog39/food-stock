#!/bin/bash -xe

cp gitlab-ci/database.yml config/database.yml

bundle install --path=${BUNDLE_CACHE} --jobs=2 --retry=3

bundle exec rails db:create
bundle exec rails db:migrate:reset
