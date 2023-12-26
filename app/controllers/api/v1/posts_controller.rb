class Api::V1::PostsController < ApplicationController
  def index
    render json: Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post
    else
      render json: post.erros, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :quantity, :price, :recommend, :image, :user)
  end
end
