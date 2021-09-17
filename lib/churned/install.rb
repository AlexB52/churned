require 'tty-option'

module Churned
  class Install
    include TTY::Option

    usage do
      program "churned"

      command "install"

      desc "Setup the '.churned' working folder."

      example(<<~EXAMPLE)
        churned install
      EXAMPLE
    end

    flag :help do
      short "-h"
      long "--help"
      desc "Print usage"
    end

    def run
      if params[:help]
        print help
        exit
      end

      unless Dir.exists?('.churned')
        Dir.mkdir('.churned', 775)
      end
    end
  end
end