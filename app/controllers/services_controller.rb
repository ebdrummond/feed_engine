class ServicesController < ApplicationController
  # before filter for grabbing the current user
  # auth sources controller
  def create
    # pass off hash to Authentication.parse_hash
    # get user id
    # save
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end