# encoding: utf-8

require 'optparse'
require 'fileutils'

module Dindi

  module CommandParser

    def self.parse(args, options)
      # The options specified on the command line will be collected in 
      # *options*.
      #
      # We set the default value here
      options.project_name = nil

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: dindi [options]"

        opts.separator " "
        opts.separator "Specific options:"

        opts.on("-n", "--name PROJECT_NAME",
                "Specify your project name PROJECT_NAME that will be created") do |lib|
          options.project_name = lib.downcase
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

      options.ruby_version = "latest"

      # set project absolute dir
      options.project_absolute_dir = nil
      if options.project_name
        FileUtils.pwd + "/" + options.project_name
      else

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
