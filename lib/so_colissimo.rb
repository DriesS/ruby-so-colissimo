require "savon"
require 'rubygems'

require "#{File.dirname(__FILE__)}/so_colissimo/client"
require "#{File.dirname(__FILE__)}/so_colissimo/result"
require "#{File.dirname(__FILE__)}/so_colissimo/error"
require "#{File.dirname(__FILE__)}/so_colissimo/point"

module SoColissimo
	
	class ConfigFileNotFoundError < StandardError; end

	def self.config
		config_path = "#{Rails.root}/config/so_colissimo.yml"
		@@config ||= YAML.load(File.open(config_path))[Rails.env.to_s].symbolize_keys
	end
  	
end