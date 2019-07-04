module PostsHelper

  def post_owner(user_id)
    @user= User.find_by(id:user_id).name
  end
end
