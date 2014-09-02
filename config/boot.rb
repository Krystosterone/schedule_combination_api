# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
require 'active_record'
require 'activerecord-tableless'
require 'representable/json'
Bundler.require(:default, RACK_ENV)

I18n.default_locale = :fr
I18n.load_path += Dir[File.expand_path('../../locale/*.yml', __FILE__)]
I18n.reload!

Padrino::Logger::Config[:test] = { log_level: :debug, stream: :to_file}
Padrino::Logger::Config[:development] = { log_level: :devel, stream: :stdout}
Padrino::Logger::Config[:production] = { log_level: :info,  stream: :to_file}

Padrino.load!