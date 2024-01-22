class Api::V1::ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    request.session_options[:skip] = true
    render json: @user.to_json(only: [:id, :name, :image, :email], include: :posts)
  end

  def update
    request.session_options[:skip] = true
    if @user.update(user_params)
      render json: @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_api_v1_user.id)
  end

  def user_params
    params.permit(:name, :email, :image)
  end
end
