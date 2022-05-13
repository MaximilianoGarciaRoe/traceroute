# frozen_string_literal: true

require 'rails'
require 'action_controller/railtie'

require 'traceroute'

module DummyApp
  class Application < Rails::Application
    config.root = File.expand_path('..', __FILE__)
    config.eager_load = false
    config.secret_key_base = '1234567890'
  end
end

module UsersHelper
  def index_helper; end
end

class ApplicationController < ActionController::Base; end

class UsersController < ApplicationController
  include UsersHelper
  def index; end
  def index2; end
  def show; end
end

module Admin; class ShopsController < ApplicationController
  def index; end
  def create; end
end; end

if defined?(ActionController::API)
  class ApiController < ActionController::API; end

  module Api; class BooksController < ApiController
    def index; end
    def create; end
  end; end
end
