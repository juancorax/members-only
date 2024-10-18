class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.author = current_user.name

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @post = Post.all
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
