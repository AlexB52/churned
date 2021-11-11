# frozen_string_literal: true

require 'thor'

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

    require_relative 'commands/db'
    register Churned::Commands::Db, 'db', 'db [SUBCOMMAND]', 'Command description...'

    desc 'console', 'Open a irb session to read the database'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def console(*)
      if options[:help]
        invoke :help, ['console']
      else
        require_relative 'commands/console'
        Churned::Commands::Console.new(options).execute
      end
    end

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
