# app/controllers/api/class_assignments_controller.rb
class Api::ClassAssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/class_assignments
  def index
    @class_assignments = ClassAssignment.where.not(class_name: nil).where.not(class_name: '')
    count = @class_assignments.count

    render json: { class_assignments: @class_assignments, count: }
  end

  # POST /api/class_assignments
  def create
    @class_assignment = ClassAssignment.new(class_params)

    if @class_assignment.save
      render json: @class_assignment, status: :created
    else
      render json: @class_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/class_assignments/:id
  def update
    @class_assignment = ClassAssignment.find(params[:id])

    if @class_assignment.update(class_params)
      render json: @class_assignment
    else
      render json: @class_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/class_assignments/:id
  def destroy
    @class_assignment = ClassAssignment.find_by(id: params[:id])

    if @class_assignment
      @class_assignment.destroy
      render json: { message: 'Class deleted successfully' }, status: :ok
    else
      render json: { error: 'Class already deleted or not present' }, status: :not_found
    end
  end

  # GET /api/students/:id
  def show
    @class_assignment = ClassAssignment.find_by(id: params[:id])
    if @class_assignment
      render json: @class_assignment
    else
      render json: { error: 'class not found' }, status: :not_found
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def class_params
    params.require(:class_assignment).permit(:class_name)
  end
end
