class Api::V1::StaticController < ApplicationController
  before_action :get_current_user

  def about
    if logged_in?
      render "about"
    else
      message: "Please Log In."
    end
  end

  def contact
    if logged_in?
      render "news"
    else
      message: "Please Log In."
    end
  end

  def contact
    if logged_in?
      render "contact"
    else
      message: "Please Log In."
    end
  end

end

