#!/bin/sh

PATH=/opt/ruby/1.9.3/bin:/opt/ruby/1.9.2/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export RAILS_ENV=test
bundle exec rake db:migrate:reset
bundle exec rake test
