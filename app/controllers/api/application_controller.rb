
class ApplicationController < ActionController::API
  
  before_action :authenticate_request

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    unless token_valid?(token)
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
  
  def token_valid?(token)
    begin
      decoded_token = JWT.decode(token, '95f0b537e51c30349a5f11e768a9b5f9ce8ea6a366bf21b3fa916777550c4bdf291b80ee543887398fd754412bb93492ce951c9482d7a9d7320f2227f650f7af
      ', true, algorithm: 'HS256')
      @current_user_id = decoded_token.first['user_id']
      true
    rescue JWT::DecodeError
      false
    end
  end