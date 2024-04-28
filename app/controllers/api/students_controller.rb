# app/controllers/api/students_controller.rb
class Api::StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/students
  def index
    @students = Student.all
    count = @students.count
    render json: { Students: @students, count: }
  end

  # GET /api/students/:id
  def show
    @student = Student.find_by(id: params[:id])
    if @student
      render json: @student
    else
      render json: { error: 'Student not found' }, status: :not_found
    end
  end

  # POST /api/students
  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/students/:id
  def update
    @student = Student.find_by(id: params[:id])
    if @student
      if @student.update(student_params)
        render json: @student
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Student not found' }, status: :not_found
    end
  end

  # DELETE /api/students/:id
  def destroy
    @student = Student.find_by(id: params[:id])
    if @student
      @student.destroy
      render json: { message: 'Student deleted successfully' }, status: :ok
    else
      render json: { error: 'Student already deleted or not present' }, status: :not_found
    end
  end

  # GET /api/students/:id/calculate_marks
  def calculate_marks
    @student = Student.find(params[:id])
    marks = calculate_student_marks(@student)
    render json: marks
  end

  def calculate_student_marks(student)
    overall_marks = student.overall_mark
    total_mark = overall_marks[:total_mark]
    average_mark = overall_marks[:average]
    { total_mark: total_mark, Moyenne: average_mark }
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
