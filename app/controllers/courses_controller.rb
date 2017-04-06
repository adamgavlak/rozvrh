class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Predmet #{@course.name} bol úspešne vytvorený"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update_attributes(course_params)
      flash[:notice] = "Predmet #{@course.name} bol upravený"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course.destroy

    flash[:notice] = "Predmet #{@course.name} bol vymazaný"
    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(:code, :name, :lectures_weekly, :classes_weekly, :lab_classes_weekly)
  end

  def find_course
    @course = Course.find(params[:id])
  end

  # Migration table:
  # t.string :code, null: false
  # t.integer :lectures_weekly
  # t.integer :classes_weekly
  # t.integer :lab_classes_weekly
end
