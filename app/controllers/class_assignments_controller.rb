class ClassAssignmentsController < ApplicationController
  def index
    @class = ClassAssignment.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  def create
    @class = ClassAssignment.new(class_assignment_params)
    if @class.save
      render json: @class, status: :created
    else
      render json: @class.errors, status: :unprocessable_entity
    end
  end

  def class_assignment_params
    params.require(:class_assignment).permit(:class_name)
  end
end
