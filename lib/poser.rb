module Poser
  class << self
    attr_accessor :username, :password
  end

  def self.authenticates?(user, pass)
    user == username && pass == password
  end
end

# require all sub-files
['model',
  'inventory_upload',
  'line_item',
  'product'].each do |file|
  require File.dirname(__FILE__) + "/poser/#{file}"
end
