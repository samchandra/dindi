# encoding: utf-8

require 'optparse'
require 'fileutils'

module Dindi

  module CommandParser

    def self.parse(args, options)
      # The options specified on the command line will be collected in *options*.
      # We set the default value here
      options.project_name = nil

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: dindi [options]"

        opts.separator " "
        opts.separator "Specific options:"

        opts.on("-n", "--name PROJECT_NAME",
                "Specify your project name PROJECT_NAME that will be created") do |lib|
          options.project_name = lib
        end

        opts.on("-r", "--ruby RUBY_VERSION",
                "Set RUBY_VERSION to 1.9.1 for compatibility mode") do |ver|
          options.ruby_version = ver
        end

        # No argument, shows at tail. This will print an options summary.
        # Try it and see!
        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          puts ""
          raise
        end

      end

      opts.parse!(args)

      if options.ruby_version.nil? or options.ruby_version.gsub(".", "").to_i > 191
        options.ruby_version = "1.9.2"
      else
        options.ruby_version = "1.9.1"
      end

      # set project absolute dir early
      options.project_absolute_dir = if options.project_name
        FileUtils.pwd + "/" + options.project_name
      else
        nil
      end

    rescue Exception => e
      if e.message.match(/invalid option/i) or e.message.match(/missing argument/i)
        puts "ERROR: #{e.message}".red
        puts ""
        puts opts
        puts ""
      end
      raise
    end

  end

end
