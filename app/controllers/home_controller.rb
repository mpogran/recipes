class HomeController < ApplicationController
  before_action :require_curr
  # GET /
  def index
    @container = current_user.containers.first
  end
end
