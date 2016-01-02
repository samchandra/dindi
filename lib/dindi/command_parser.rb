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
      options.with_bundle_install = false

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: dindi [options]"

        opts.separator " "
        opts.separator "Specific options:"

        opts.on("-n", "--name PROJECT_NAME",
                "Specify your project name PROJECT_NAME that will be created") do |project_name|
          options.project_name = project_name.downcase
        end

        opts.on("-b", "--[no-]bundle-install", "Run bundler install after project creation") do |b|
          options.with_bundle_install = b
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
        options.project_absolute_dir = File.join(FileUtils.pwd, options.project_name)
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
