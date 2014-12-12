#!/bin/bash


export PATH=/opt/rbenv/shims:/opt/rbenv/bin:/usr/bin:$PATH
eval "$(rbenv init -)"

cd /opt/cronmon && bundle exec ruby ./cron_wrapper.rb $1
