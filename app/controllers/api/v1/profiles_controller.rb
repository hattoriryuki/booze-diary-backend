class Api::V1::ProfilesController < ApplicationController
  before_action :set_user, only: %i[show update]
  before_action :authenticate_user!, only: %i[update]

  def show
    render json: @user.to_json(only: [:id, :name, :image, :email], include: :posts)
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :image)
  end
end
