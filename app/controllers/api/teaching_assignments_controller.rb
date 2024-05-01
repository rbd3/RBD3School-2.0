# app/controllers/api/teaching_assignments_controller.rb
class Api::TeachingAssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/teaching_assignments
  def index
    @teaching_assignments = TeachingAssignment.all
    render json: @teaching_assignments
  end

  # GET /api/teaching_assignments/:id
  def show
    @teaching_assignment = TeachingAssignment.find_by(id: params[:id])
    if @teaching_assignment
      render json: @teaching_assignment
    else
      render json: { error: 'Teaching assignment not found' }, status: :not_found
    end
  end

  # POST /api/teaching_assignments
  def create
    @teaching_assignment = TeachingAssignment.new(teaching_assignment_params)
    if @teaching_assignment.save
      render json: @teaching_assignment, status: :created
    else
      render json: @teaching_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/teaching_assignments/:id
  def update
    @teaching_assignment = TeachingAssignment.find_by(id: params[:id])
    if @teaching_assignment
      if @teaching_assignment.update(teaching_assignment_params)
        render json: @teaching_assignment
      else
        render json: @teaching_assignment.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Teaching assignment not found' }, status: :not_found
    end
  end

  # DELETE /api/teaching_assignments/:id
  def destroy
    @teaching_assignment = TeachingAssignment.find_by(id: params[:id])
    if @teaching_assignment
      @teaching_assignment.destroy
      render json: { message: 'Teaching assignment deleted successfully' }, status: :ok
    else
      render json: { error: 'Teaching assignment already deleted or not present' }, status: :not_found
    end
  end

  private

  def teaching_assignment_params
    params.require(:teaching_assignment).permit(:teacher_id, :subject_id, :class_assignment_id)
  end
end
