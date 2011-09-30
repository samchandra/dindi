#! /usr/bin/env ruby

# script to automate creation of new sinatra project
require 'ostruct'
require 'optparse'
require 'fileutils'

class OptionParser

  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set the default value here
    options = OpenStruct.new
    options.project_name = nil

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: dindi.rb [options]"

      opts.separator " "
      opts.separator "Specific options:"

      # mandatory argument project directory
      opts.on("-n", "--name PROJECT_NAME",
              "Specify your project name PROJECT_NAME that will be created") do |lib|
        options.project_name = lib
      end

      # No argument, shows at tail. This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

    end

    opts.parse!(args)
    options
  end

end

# make sure ARGV has values
if ARGV.size == 0
  puts "ERROR: Parameters needed.  Run with -h to view options"
  exit
end

# parse option from command line
options = OptionParser.parse(ARGV)

# make sure project name is valid
if options.project_name.nil?
  puts "ERROR: PROJECT_NAME is needed. Run with -h to view options"
  exit
end

project_absolute_dir = FileUtils.pwd + "/" + options.project_name

# create default directories
# lib, log, public, push, routes, tmp, views
%w(lib log public push routes tmp views db).each do |dir|
  FileUtils.mkdir_p(project_absolute_dir + "/" + dir)
end

#=================
# create config.ru
#=================

config_ru_contents = <<-config_ru
# gems
%w(sinatra logger json haml csv digest pony date time activesupport).each  {|lib| require lib}

# extra library
# require '#{project_absolute_dir}/lib/websocket_client'

# app files
%w(#{options.project_name}).each {|lib| require lib}

Time.zone = 'Singapore'

# server config
set     :environment, :production
enable  :sessions, :logging, :dump_errors, :show_exceptions
disable :run, :reload

run Sinatra::Application
config_ru

File.open("#{project_absolute_dir}/config.ru", "w") do |file|
  file.puts config_ru_contents
end

#==================
# create helpers.rb
#==================

helpers_rb_contents = <<-helpers_rb
helpers do

  def debug_on
    $LOG.info("===== START =====> #{Time.now.strftime("%d/%m/%Y %H:%M %p")}")
    $LOG.info(request.url)
    $LOG.info("Params:")
    params.each do |key, value|
      $LOG.info("\#{key} => \#{value}")
    end
  end
  
  def logger(text)
    $LOG.info(text)
  end
  
end
helpers_rb

File.open("#{project_absolute_dir}/helpers.rb", "w") do |file|
  file.puts helpers_rb_contents
end

#====================
# create database.yml
#====================

database_yml_contents = <<-database_yml
login: &login
  adapter: mysql
  username: root
  password: password
  host: localhost
  timezone: SGT
  reconnect: true

production:
  <<: *login
  database: #{options.project_name}
  encoding: utf8
database_yml

File.open("#{project_absolute_dir}/db/database.yml", "w") do |file|
  file.puts database_yml_contents
end

#====================
# create db_config.rb
#====================

db_config_contents = <<-db_config_rb
#gem 'activerecord', '=2.3.8'
require 'activerecord'
config = YAML.load_file(File.join(File.dirname(__FILE__),'database.yml'))
ActiveRecord::Base.establish_connection(config["production"])
db_config_rb

File.open("#{project_absolute_dir}/db/db_config.rb", "w") do |file|
  file.puts db_config_contents
end

#=======================
# create models.rb
#=======================

models_rb_contents = <<-models_rb
require '#{project_absolute_dir}/db/db_config'

# DB Models

# class Token < ActiveRecord::Base
# end
models_rb

File.open("#{project_absolute_dir}/models.rb", "w") do |file|
  file.puts models_rb_contents
end

#=======================
# create project_name.rb
#=======================

project_name_rb_contents = <<-project_name_rb
# DB connection and data models
# require 'models'

# logger 
before do 
  $LOG = Logger.new('log/#{options.project_name}.log')
end

require 'helpers'

# index
get '/' do
  '#{options.project_name}'
end

# docs
get '/docs' do
  haml :docs
end

### Load other routes
# load 'routes/startup.rb'
project_name_rb

File.open("#{project_absolute_dir}/#{options.project_name}.rb", "w") do |file|
  file.puts project_name_rb_contents
end

#=======================
# create docs.haml
#=======================

docs_haml_contents = <<-docs_haml
%h1 API Docs

%p
  %b{:style=>"color: red"}
    http://servername
  %br
    (GET) Returns app name
docs_haml

File.open("#{project_absolute_dir}/views/docs.haml", "w") do |file|
  file.puts docs_haml_contents
end
