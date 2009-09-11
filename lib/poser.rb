module Poser
  class << self
    attr_accessor :username, :password
  end

  def self.authenticates?(user, pass)
    user == username && pass == password
  end
end
