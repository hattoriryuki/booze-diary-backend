class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_api_v1_user!, only: %i[create update destroy]
  def index
    posts = Post.all.includes(:user).order(created_at: :desc)
    render json: posts.to_json(include: { user: { only: [:id, :name, :image] } })
  end

  def show
    render json: @post.to_json(include: { user: { only: [:id, :name, :image] } })
  end

  def create
    request.session_options[:skip] = true
    post = current_api_v1_user.posts.build(post_params);

    if post.save
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    request.session_options[:skip] = true
    if @post.update(post_params)
      render json: @post
    else
      render :edit
    end
  end

  def destroy
    request.session_options[:skip] = true
    @post.destroy
    render json: @post
  end

  private

  def post_params
    params.permit(:name, :quantity, :price, :recommend, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
