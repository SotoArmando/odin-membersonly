module SessionsHelper

  def current_user
    if session[:user_id]
     @current_user = User.find_by(id: session[:user_id])
    end
  end

   def forget(user)
     user.delete_remember_token
     cookies.delete(:user_id)
     cookies.delete(:remember)
   end

  def log_out
    forget(current_user)
    @current_user = nil
    session.delete(:user_id)
    session.delete(:remember)

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
