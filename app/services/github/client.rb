# frozen_string_literal: true

module Github
  class Client
    include Connection
    include Configurable
    include Default
    include Clients::Repositories

    def initialize(options = {})
      Github::Configurable.keys.each do |key|
        value = options.key?(key) ? options[key] : Default.public_send(:"#{key}")
        instance_variable_set(:"@#{key}", value)
      end
    end
  end
end
