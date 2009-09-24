module Poser
  module Model
    def initialize(fields = {})
      copy_fields_into_instance_variables!(fields)
    end

    private
    def copy_fields_into_instance_variables!(fields)
      fields.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
end
