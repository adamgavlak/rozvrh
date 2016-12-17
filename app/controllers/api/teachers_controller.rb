class Api::TeachersController < ApplicationController
  # TODO: API Authentication
  skip_before_action :verify_authenticity_token

  def index
    @teachers = Teacher.all
    render json: @teachers
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      render nothing: true, status: 201
    else
      render nothing: true, status: 400
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    render json: @teacher
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update_attributes(teacher_params)
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])

    if @teacher.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:personal_number, :name, :is_lecturer, :wage)
  end
end
