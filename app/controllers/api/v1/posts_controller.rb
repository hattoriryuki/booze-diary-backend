class Api::V1::PostsController < ApplicationController
  def index
    render json: Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    request.session_options[:skip] = true
    post = current_api_v1_user.posts.build(post_params);

    if post.save
      render json: post
    else
      render json: post.errors, status: 422
    end
  end

  private

  def post_params
    params.permit(:name, :quantity, :price, :recommend, :image)
  end
end
