require 'dotenv'
Dotenv.load
require 'newrelic_rpm'

require 'require_all'
require_all 'lib'

NewRelic::Agent.manual_start

run WhatIDid