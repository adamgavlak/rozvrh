class Api::TeachersController < Api::ApplicationController
  before_action :find_teacher, only: [:show, :update, :destroy]

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
    render json: @teacher
  end

  def update
    if @teacher.update_attributes(teacher_params)
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  def destroy
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

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
