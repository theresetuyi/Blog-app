class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def post_path(post_id)
    @post = Post.find(post_id)
    Rails.application.routes.url_for(controller: 'posts', action: 'show', id: post_id)
  end

  def create
    @post = Post.new(author_id: current_user.id, title: params[:title],
                     text: params[:text], comments_counter: 0, likes_counter: 0)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
