# frozen_string_literal: true

require_relative "./covid_19_tracker/version"
require_relative './covid_19_tracker/cli'
require_relative './covid_19_tracker/global'
require_relative './covid_19_tracker/country'
require_relative './covid_19_tracker/scraper'
require 'net/http'
require 'open-uri'
require 'json'
require 'pry'
# require 'nokogiri'
# require 'open-uri'
# require 'pry'


# module Covid19Tracker
#   class Error < StandardError; end
#   # Your code goes here...
# end
