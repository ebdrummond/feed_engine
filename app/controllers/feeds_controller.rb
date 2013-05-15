class FeedsController < ApplicationController
  before_filter :require_login

  def index
    @trips = current_user.trips
  end
end
