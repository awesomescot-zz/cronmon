#!/bin/bash


export PATH=/opt/rbenv/shims:/opt/rbenv/bin:/usr/bin:$PATH
export GEM_HOME=/opt/cronmon/vendor/bundler/ruby/2.0.0/gems
eval "$(rbenv init -)"
cd /opt/cronmon && ruby cron_wrapper.rb $1
