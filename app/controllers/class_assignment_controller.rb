class ClassAssignmentController < ApplicationController

    def index
        @class = ClassAssignment.all
      end
end
