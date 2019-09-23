# frozen_string_literal: true

require "rubygems"
require "httparty"

# response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
# puts response.code

class Blah
  include ActiveSupport::Callbacks
  define_callbacks :validate
  set_callbacks :validate, :before, :check_everything
  before_save :check_permission

  def check_everything
    puts "checking"
  end

  def validate
    send(:run_validate_callback)
  end
end
playa = User.new.validate
