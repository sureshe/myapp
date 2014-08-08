ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require "rails/application"
require 'rspec/rails'
require 'factory_girl_rails'
require 'database_cleaner'
require 'json_expressions/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation, { except: %w(roles) }
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end










  

  

 
