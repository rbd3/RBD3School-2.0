class Api::TeachersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/students
  def index
    @teachers = Teacher.all
    count = @teachers.count
    render json: { teachers: @teachers, count: }
  end

  # GET /api/students/:id
  def show
    @teachers = Teacher.find_by(id: params[:id])
    if @teachers
      render json: @teachers
    else
      render json: { error: 'teacher not found' }, status: :not_found
    end
  end

  # POST /api/students
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: @teacher, status: :created
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/students/:id
  def update
    @teacher = Teacher.find_by(id: params[:id])
    if @teacher
      if @teacher.update(teacher_params)
        render json: @teacher
      else
        render json: @teacher.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'teacher not found' }, status: :not_found
    end
  end

  # DELETE /api/students/:id
  def destroy
    @teacher = Teacher.find_by(id: params[:id])
    if @teacher
      @teacher.destroy
      render json: { message: 'teacher deleted successfully' }, status: :ok
    else
      render json: { error: 'teacher already deleted or not present' }, status: :not_found
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :subject_taught)
  end
end
