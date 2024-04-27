# app/controllers/api/users_controller.rb
class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/users
  def index
    @users = User.all
    count = @users.count
    render json: { users: @users, count: }
  end

  # GET /api/users/:id
  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # POST /api/users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /api/user/:id
  def update
    @user = User.find_by(id: params[:id])
    if @user
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'user not found' }, status: :not_found
    end
  end


  # DELETE /api/students/:id
  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      render json: { message: 'user deleted successfully' }, status: :ok
    else
      render json: { error: 'user already deleted or not present' }, status: :not_found
    end
  end


  private

  # Only allow a list of trusted parameters through.
  def user_params
    params[:user][:role]&.downcase!
    params.require(:user).permit(:firts_name, :last_name, :email, :role)
  end
end
