class SessionsController < ApplicationController
  def new
  end



  def create
     user = User.find_by(email: params[:sessions][:email])
      if user && user.authenticate(params[:sessions][:password])
        log_in(user)
        remember(user)
        flash[:success] = 'your logged in'
        redirect_to '/'
      else
        flash[:danger] = 'Wrong password or email'
        render :new
      end
    end
end
