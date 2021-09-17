module Churned
  class Commands
    def self.for(options)
      new(options).command
    end

    attr_reader :options
    def initialize(options)
      @options = options
    end

    def command
      case options[0]
      when "install"
        Install.new
      end&.parse(options)
    end
  end
end