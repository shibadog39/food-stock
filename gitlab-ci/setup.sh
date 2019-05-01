#!/bin/bash -xe

cp gitlab-ci/database.yml config/database.yml

gem install bundler
bundle install

bundle exec rails db:create
bundle exec rails db:migrate:reset
