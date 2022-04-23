class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user), status: :ok
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def get_current_user
    if logged_in?
      render json: UserSerializer.new(current_user)
    else
      render json: {
        error: "You Must Log In To View This App"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "Successfully Logged Out"
    }, status: :ok
  end

end