# app/controllers/api/subjects_controller.rb
class Api::SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/subjects
  def index
    @subjects = Subject.all
    count = @subjects.count
    render json: { subjects: @subjects, count: count }
  end

  # GET /api/subjects/:id
  def show
    @subject = Subject.find_by(id: params[:id])
    if @subject
      render json: @subject
    else
      render json: { error: 'Subject not found' }, status: :not_found
    end
  end

  # POST /api/subjects
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/subjects/:id
  def update
    @subject = Subject.find_by(id: params[:id])
    if @subject
      if @subject.update(subject_params)
        render json: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Subject not found' }, status: :not_found
    end
  end

  # DELETE /api/subjects/:id
  def destroy
    @subject = Subject.find_by(id: params[:id])
    if @subject
      @subject.destroy
      render json: { message: 'Subject deleted successfully' }, status: :ok
    else
      render json: { error: 'Subject already deleted or not present' }, status: :not_found
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:title)
  end
end
