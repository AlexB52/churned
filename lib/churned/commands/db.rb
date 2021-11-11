# frozen_string_literal: true

require 'thor'

module Churned
  module Commands
    class Db < Thor

      namespace :db

      desc 'load', 'Command description...'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def load(*)
        if options[:help]
          invoke :help, ['load']
        else
          require_relative 'db/load'
          Churned::Commands::Db::Load.new(options).execute
        end
      end

      desc 'create', 'Command description...'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def create(*)
        if options[:help]
          invoke :help, ['create']
        else
          require_relative 'db/create'
          Churned::Commands::Db::Create.new(options).execute
        end
      end
    end
  end
end
