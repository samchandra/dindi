# encoding: utf-8

require 'erb'

module Dindi
  module FileHelper

    def self.create_default_directories(options)
      project_absolute_dir = options.project_absolute_dir
      %w(tmp log public push configs views routes extlibs models helpers tests scripts).each do |dir|
        FileUtils.mkdir_p(File.join(project_absolute_dir, dir))
      end
    end

    def self.copy_file_templates(options)
      project_absolute_dir = options.project_absolute_dir
      ruby_version = options.ruby_version

      # version specific file templates and shared template together
      [ruby_version, "shared"].each do |dir_name|

        Dir.glob(File.join(File.dirname(__FILE__), 'file_templates', dir_name, '*')).each do |file|
          filename = File.basename(file, ".*")

          # read file as ERB templates
          content = File.open(file, "r").read
          template = ERB.new content

          # file copy location
          file_location = template_file_copy_location(filename, options)

          # write the contents of each file to the project directory
          File.open(file_location, "w") do |file|

            # write file after running the templates
            file.puts template.result(binding)
          end
        end

      end

    end

    def self.template_file_copy_location(filename, options)
      project_absolute_dir = options.project_absolute_dir

      # copy location for not common template files
      special_location_hash = {"debug_on.rb"        => File.join(project_absolute_dir, 'helpers', 'debug_on.rb'),
                               "deploy_setting.rb"  => File.join(project_absolute_dir, 'configs', 'deploy_setting.rb'),
                               "docs.haml"          => File.join(project_absolute_dir, 'views', 'docs.haml'), 
                               "docs_controller.rb" => File.join(project_absolute_dir, 'routes', 'docs_controller.rb'), 
                               "main_controller.rb" => File.join(project_absolute_dir, 'routes', 'main_controller.rb')
                              }

      if special_location_hash[filename]
        return special_location_hash[filename]
      else
        return File.join(project_absolute_dir, filename)
      end

    end

  end
end
