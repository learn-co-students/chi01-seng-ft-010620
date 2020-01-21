require 'bundler'
Bundler.require

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)
require_all 'lib'
