class CommentsController < ApplicationController
  before_action :set_comment, only: [:create]

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(post_params) # use post_params because a comment is
                                        # attached to a post?

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
