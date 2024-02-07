class Api::V1::Auth::SessionsController < Devise::SessionsController
  def index
    if current_api_v1_user
      render json: { is_login: true, data: current_api_v1_user }
    else
      render json: { is_login: false, message: 'ユーザーが存在しません' }
    end
  end

  def destroy
    reset_session
    render json: { status: 200, is_logout: true }
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    render json: user
  end
end
