class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # Prehľad predmetov
  def index
    @courses = Course.all
  end

  # Formulár nového predmetu
  def new
    @course = Course.new
  end

  # Vytvorenie nového predmetu
  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Predmet #{@course.name} bol úspešne vytvorený"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  # Prehľad predmetu
  def show
  end

  # Formulár úpravy predmetu
  def edit
  end

  # Úprava predmetu
  def update
    if @course.update_attributes(course_params)
      flash[:notice] = "Predmet #{@course.name} bol upravený"
      redirect_to courses_path
    else
      render :edit
    end
  end

  # Zmazanie predmetu
  def destroy
    @course.destroy

    flash[:notice] = "Predmet #{@course.name} bol vymazaný"
    redirect_to courses_path
  end

  private
  # Whitlisting parametrov z requestu
  def course_params
    params.require(:course).permit(:code, :name, :lectures_weekly, :classes_weekly, :lab_classes_weekly)
  end

  # Nájdenie predmetu
  def find_course
    @course = Course.find(params[:id])
  end

  # Migrácia:
  # t.string :code, null: false
  # t.integer :lectures_weekly
  # t.integer :classes_weekly
  # t.integer :lab_classes_weekly
end
