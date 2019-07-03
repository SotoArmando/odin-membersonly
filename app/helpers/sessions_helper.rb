module SessionsHelper
  def log_out()
    session.delete(:user_id)
  end
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end
  def remember(user)
     user.remember
     cookies.permanent.signed[:user_id] = user.id
     cookies.permanent[:remember] = user.remember_token
  end
end
