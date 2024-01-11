class Api::V1::UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user.to_json(only: [:id, :name, :image], include: :posts)
  end

  def index
    render json: User.all
  end
end
