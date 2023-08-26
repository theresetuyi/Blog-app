class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: params[:text])
    @comment.author = current_user
    if @comment.save
      redirect_to "/users/#{@comment.author.id}/posts/#{@comment.post.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
