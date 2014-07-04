# encoding: utf-8

require 'erb'

module Dindi
  module FileHelper

    def self.create_default_directories(options)
      project_absolute_dir = options.project_absolute_dir
      %w(tmp log public push views routes extlibs models helpers tests scripts).each do |dir|
        FileUtils.mkdir_p(project_absolute_dir + "/" + dir)
      end
    end

    def self.copy_file_templates(options)
      project_absolute_dir = options.project_absolute_dir
      ruby_version = options.ruby_version

      # version specific file templates and shared template together
      [ruby_version, "shared"].each do |dir_name|

        Dir.glob(File.dirname(__FILE__) + "/file_templates/#{dir_name}/*").each do |file|
          filename = file.split("/").last.gsub(".erb", "")

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
      special_location_hash = {"helpers.rb"      => "#{project_absolute_dir}/helpers/helpers.rb",
                               "docs.haml"       => "#{project_absolute_dir}/views/docs.haml", 
                               "project_name.rb" => "#{project_absolute_dir}/#{options.project_name}.rb"
                              }

      if special_location_hash[filename]
        return special_location_hash[filename]
      else
        return "#{project_absolute_dir}/#{filename}"
      end

    end

  end
end
