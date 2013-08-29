class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find_by(slug: params[:post_id])
    @comment = Comment.new(content: params[:comment][:content])
    @comment.post = @post
    @comment.creator = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render 'posts/show'
    end
  end

  def vote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        flash[:notice] = 'Your vote was counted.'
        redirect_to :back
      end

      format.js do
        render :vote_comments
      end
    end
  end

end