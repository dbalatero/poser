module Poser
  class Address
    include Poser::Model

    attr_accessor :first_name
    attr_accessor :middle_initial
    attr_accessor :last_name
    attr_accessor :address1
    attr_accessor :address2
    attr_accessor :city
    attr_accessor :state
    attr_accessor :country
    attr_accessor :postal_code
    attr_accessor :phone
    attr_accessor :phone_extension
    attr_accessor :email
    
    def name
      [first_name, middle_initial, last_name].
        compact.join(' ')
    end
  end
end
