class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_name(params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice:'Logged in successfully.'
    else
      flash.now[:error]='Invalid username or password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice:'Logged out.'
  end
end
