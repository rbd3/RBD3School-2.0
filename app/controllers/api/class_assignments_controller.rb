# app/controllers/api/class_assignments_controller.rb
class Api::ClassAssignmentsController < ApplicationController
    skip_before_action :verify_authenticity_token

        # GET /api/class_assignments
    def index
        @class_assignments = ClassAssignment.where.not(class_name: nil).where.not(class_name: '')
        count = @class_assignments.count
    
        render json: { class_assignments: @class_assignments, count: count }
    end
  
  
    # POST /api/class_assignments
    def create
      @class_assignment = ClassAssignment.new(class_name: params[:class_name])
  
      if @class_assignment.save
        render json: @class_assignment, status: :created
      else
        render json: @class_assignment.errors, status: :unprocessable_entity
      end
    end
  
  end
  