class ApplicationController < ActionController::API
  before_action :authenticate_request

  def authenticate_request
    token = request.headers['Authorization']&.split&.last
    return if token_valid?(token)

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def token_valid?(token)
    decoded_token = JWT.decode(token, 'secret_key', true, algorithm: 'HS256')
    @current_user_id = decoded_token.first['user_id']
    true
  rescue JWT::DecodeError
    false
  end
end
