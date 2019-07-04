class PostsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
      @post = Post.new
      @post.user_id = current_user.id 
      @post.name = params.require(:post).permit(:title)
      @post.desc = params.require(:post).permit(:body)
      @post.save
  end

  def edit 
  end

  private 
      def authenticate_user
          unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to '/sign_in'
          end 
      end

end
