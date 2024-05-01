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
  def signup
    @user = User.new(user_params)
    if @user.save
      if @user.role == 'teacher'
        @teacher = Teacher.create(user: @user, first_name: @user.first_name, last_name: @user.last_name,
                                  email: @user.email, subject_taught: params[:subject_taught])
        render json: { user: @user, teacher: @teacher }, status: :created
      elsif @user.role == 'student'
        @student = Student.create(user: @user, first_name: @user.first_name, last_name: @user.last_name,
                                  email: @user.email, matricule: params[:matricule])
        render json: { user: @user, student: @student }, status: :created
      else
        render json: @user, status: :created
      end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /api/users/login
  def login
    @user = User.find_by(email: params[:email])

    if @user&.valid_password?(params[:password])
      render json: { message: 'Login successful', user: @user }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
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

  # DELETE /api/users/:id
  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      destroy_user_and_associations(@user)
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # DELETE /api/users
  def destroy_all
    ActiveRecord::Base.transaction do
      User.destroy_all
      render json: { message: 'All users deleted successfully' }, status: :ok
    end
  rescue ActiveRecord::InvalidForeignKey => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  # Method to delete user and its associated teacher and student records
  def destroy_user_and_associations(user)
    teacher = user.teacher
    student = user.student

    ActiveRecord::Base.transaction do
      teacher&.destroy
      student&.destroy
      user.destroy

      render json: { message: 'User and associated records deleted successfully' }, status: :ok
    rescue ActiveRecord::RecordNotDestroyed => e
      render json: { error: e.message }, status: :unprocessable_entity
      raise ActiveRecord::Rollback
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params[:user][:role]&.downcase!
    params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
  end
end
