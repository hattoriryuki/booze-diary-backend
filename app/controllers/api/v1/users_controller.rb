class Api::V1::UsersController < ApplicationController
  def show
    render json: User.find(params[:id])
  end

  def index
    render json: User.all
  end
end
