$:.unshift(File.dirname(__FILE__))

module Fdoc
  DEFAULT_SERVICE_PATH = "docs/fdoc"
  DEFAULT_BASE_FOLDER  = 'controllers'

  def self.scaffold_mode?
    ENV['FDOC_SCAFFOLD']
  end

  def self.service_path=(service_path)
    @service_path = service_path
  end

  def self.service_path
    @service_path || DEFAULT_SERVICE_PATH
  end

  def self.versions_support=(versions_support)
    @versions_support = versions_support
  end

  def self.versions_support
    @versions_support || false
  end

  def self.base_folder=(base_folder)
    @base_folder = base_folder.sub('/', '')
  end

  def self.base_folder
    @base_folder || DEFAULT_BASE_FOLDER
  end

  def self.decide_success_with(&block)
    @success_block = block
  end

  def self.decide_success(*args)
    if @success_block
      @success_block.call(*args)
    else
      true
    end
  end

  # Top-level fdoc validation error, abstract.
  class ValidationError < StandardError; end

  # Indicates an unknown response code.
  class UndocumentedResponseCode < ValidationError; end
end

require 'fdoc/service'
require 'fdoc/meta_service'
require 'fdoc/endpoint'
require 'fdoc/endpoint_scaffold'
require 'fdoc/presenters/json_presenter'
require 'fdoc/presenters/base_presenter'
require 'fdoc/presenters/service_presenter'
require 'fdoc/presenters/meta_service_presenter'
require 'fdoc/presenters/endpoint_presenter'
require 'fdoc/presenters/schema_presenter'
require 'fdoc/presenters/response_code_presenter'
