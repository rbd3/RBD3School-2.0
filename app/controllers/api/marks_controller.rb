class Api::MarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/marks
  def index
    @marks = Mark.all
    render json: @marks
  end

  # GET /api/marks/:id
  def show
    @marks = Mark.find_by(id: params[:id])
    if @marks
      render json: @marks
    else
      render json: { error: 'marks not found' }, status: :not_found
    end
  end

  # POST /api/marks
  def create
    @mark = Mark.new(mark_params)

    if @mark.save
      render json: @mark, status: :created
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/marks/:id
  def update
    @mark = Mark.find_by(id: params[:id])
    if @mark
      if @mark.update(mark_params)
        render json: @mark
      else
        render json: @mark.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'mark not found' }, status: :not_found
    end
  end

  # DELETE /api/marks/:id
def destroy
  @mark = Mark.find_by(id: params[:id])
  if @mark
    @mark.destroy
    render json: { message: 'mark deleted successfully' }, status: :ok
  else
    render json: { error: 'mark already deleted or not present' }, status: :not_found
  end
end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mark
    @mark = Mark.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mark_params
    params.require(:mark).permit(:mark_value, :student_id, :subject_id)
  end
end
