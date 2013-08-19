class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_creator, only: [:edit, :update]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: "Your post was created successfully."
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "Your post was edited successfully."
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:url, :title, :description)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def require_creator
      access_denied unless logged_in? && current_user == @post.creator
    end
end
