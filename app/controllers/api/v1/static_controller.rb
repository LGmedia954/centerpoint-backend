class Api::V1::StaticController < ApplicationController
  before_action :set_user, only: [:about]

  def about
    render "about"
  end

end

