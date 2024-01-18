class Api::V1::ProfilesController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    request.session_options[:skip] = true
    render json: @user.to_json(only: [:id, :name, :image, :email], include: :posts)
  end

  private

  def set_user
    @user = User.find(current_api_v1_user.id)
  end
end
