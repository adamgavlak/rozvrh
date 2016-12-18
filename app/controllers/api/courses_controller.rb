class Api::CoursesController < Api::ApplicationController
  before_action :find_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render nothing: true, status: 201
    else
      render nothing: true, status: 400
    end
  end

  def show
    render json: @course
  end

  def update
    if @course.update_attributes(course_params)
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  def destroy
    if @course.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  private
  def course_params
    params.require(:course).permit(:course_code, :lectures_weekly, :classes_weekly, :lab_classes_weekly)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
