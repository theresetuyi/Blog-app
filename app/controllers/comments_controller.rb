class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: params[:text])
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(current_user, @comment.post), notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    # Use authorize! to check authorization
    authorize! :destroy, @comment

    if @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted.'
    else
      redirect_to post_path(@comment.post), alert: 'Failed to delete the comment.'
    end
  end
end
