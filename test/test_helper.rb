require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path('../../config/environment', __FILE__)
  require 'rails/test_help'
end

Spork.each_run do
  # This code will be run each time you run your specs.
  Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','..',
    'spec','factories','*.rb'))].each { |f| require f }
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_valid_message hash
    attributes = { 
      subject: 'A valid subject',
      body: 'A valid body should have at least 40 characters ' +
            "*"*40
    }
    Message.new( attributes.merge(hash) )
  end
end
