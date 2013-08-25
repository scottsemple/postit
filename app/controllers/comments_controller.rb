class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(content: params[:comment][:content])
    @comment.post = @post
    @comment.creator = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render 'posts/show'
    end
  end

end
