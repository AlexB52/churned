# frozen_string_literal: true

require 'thor'
require "active_record"
require "sqlite3"

module Churned
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'churned version'
    def version
      require_relative 'version'
      puts "v#{Churned::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'install', 'Creates the \'.churned\' working directory'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def install(*)
      if options[:help]
        invoke :help, ['install']
      else
        require_relative 'commands/install'
        Churned::Commands::Install.new(options).execute
      end
    end
  end
end
