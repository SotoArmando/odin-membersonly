class PostsController < ApplicationController
  before_action :logged_in_user,     only: [:new,:create]
  def create
      @post = Post.new
      @post.user_id = current_user.id 
      @post.name = params.require(:post).permit(:name)
      @post.desc = params.require(:post).permit(:desc)
      @post.save
  end
  def new 
      @post = Post.new
  end
  def edit 
  end
  private 
      def logged_in_user
          unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to '/sign_up'
          end 
      end

end
