class PostsController < ApplicationController

  before_action :authenticate_user!
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post was created'
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end
