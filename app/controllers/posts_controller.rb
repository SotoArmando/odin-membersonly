class PostsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id 
      @post.save
      redirect_to root_path
  end

  def edit 
  end

  private 

      def post_params
        params.require(:post).permit(:title, :body)
      end

      def authenticate_user
          unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to '/sign_in'
          end 
      end

end
