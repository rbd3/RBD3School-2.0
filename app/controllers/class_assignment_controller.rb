class ClassAssignmentController < ApplicationController

    def index
        @class = ClassAssignment.all
      end

      def create
        @class = ClassAssignment.new(class_assignment_params)
        if @class.save
          render json: @class, status: :created
        else
          render json: @class.errors, status: :unprocessable_entity
        end

      def class_assignment_params
        params.require(:class_assignment).permit(:class_name)
      end
end
