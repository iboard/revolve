ENV["RAILS_ENV"] = "test"
require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_filter "/features/"
end

require 'rubygems'
require 'spork'

Spork.prefork do
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
  require 'cucumber/rails/rspec'
  require 'cucumber/rails/world'
  require 'cucumber/web/tableish'

  require 'capybara/rails'
  require 'capybara/cucumber'
  require 'capybara/session'

  Dir.new("#{Rails.root}/test/factories/").reject {|r| !r.match(/\.rb$/) }.each do |factory|
    require "#{Rails.root}/test/factories/#{factory}"
  end

  require 'factory_girl'
  require 'factory_girl/step_definitions'

  Capybara.default_selector = :css
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
end


Spork.each_run do
  # This code will be run each time you run your specs.
  Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','..',
    'spec','factories','*.rb'))].each { |f| require f }
end

