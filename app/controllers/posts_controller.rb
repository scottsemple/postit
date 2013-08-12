class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    # TODO: Double-check edit actions when back in Boston. Anything here? Or no,
    #    because it's only a GET request of the edit form?
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
end
