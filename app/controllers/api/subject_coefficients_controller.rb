class Api::SubjectCoefficientsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    # GET /api/subject_coefficients
    def index
      @subject_coefficients = SubjectCoefficient.all
      @count = @subject_coefficients.count
      render json: { subject_coefficients: @subject_coefficients, count: @count}
    end
  
    # GET /api/subject_coefficients/:id
    def show
      @subject_coefficient = SubjectCoefficient.find(params[:id])
      render json: @subject_coefficient
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Subject coefficient not found' }, status: :not_found
    end
  
    # POST /api/subject_coefficients
    def create
      @subject_coefficient = SubjectCoefficient.new(subject_coefficient_params)
      if @subject_coefficient.save
        render json: @subject_coefficient, status: :created
      else
        render json: @subject_coefficient.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/subject_coefficients/:id
    def update
      @subject_coefficient = SubjectCoefficient.find(params[:id])
      if @subject_coefficient.update(subject_coefficient_params)
        render json: @subject_coefficient
      else
        render json: @subject_coefficient.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Subject coefficient not found' }, status: :not_found
    end
  
    # DELETE /api/subject_coefficients/:id
    def destroy
      @subject_coefficient = SubjectCoefficient.find(params[:id])
      @subject_coefficient.destroy
      render json: { message: 'Subject coefficient deleted successfully' }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Subject coefficient already deleted or not present' }, status: :not_found
    end
  
    private
  
    def subject_coefficient_params
      params.require(:subject_coefficient).permit(:subject_id, :class_assignment_id, :coefficient)
    end
  end
  