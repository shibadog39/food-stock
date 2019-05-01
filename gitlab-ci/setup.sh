#!/bin/bash -xe

cp gitlab-ci/database.yml config/database.yml

bundle install --jobs=2 --retry=3

bundle exec rails db:create
bundle exec rails db:migrate:reset
