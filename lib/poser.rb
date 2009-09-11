module Poser
  class << self
    attr_accessor :username, :password
  end

  def self.authenticates?(user, pass)
    user == username && pass == password
  end
end

# require all sub-files
Dir.glob(File.dirname(__FILE__) + "/poser/**/*.rb").each do |file|
  require file
end
