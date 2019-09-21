module SessionsHelper

  def current_user
       user ||=  User.find_by(id: cookies.signed[:user_id])
      if user && user.decrypt(cookies.signed[:remember])
        log_in(user)
        @current_user = user
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
     cookies.permanent.signed[:remember] = user.remember_token
  end
end
