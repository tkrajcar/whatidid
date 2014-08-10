require 'dotenv'
Dotenv.load
require 'newrelic_rpm'
require_relative 'lib/whatidid'

NewRelic::Agent.manual_start

run WhatIDid