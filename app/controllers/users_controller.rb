class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] =  'Account created'
      log_in(@user)
      remember(@user)
      redirect_to root_path
    else
      flash[:danger] = "there are some error please resolve them #{@user.errors.full_messages}"
    end
  end



  private
  def user_params
  params.require(:user).permit(:email, :name, :password )
  end
end
