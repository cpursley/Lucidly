class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :except => [:index, :show, :about]
  require 'will_paginate/array'

  def about
  end

end