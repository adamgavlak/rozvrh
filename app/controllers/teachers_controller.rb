class TeachersController < ApplicationController
  before_action :find_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
    @tgc = @teacher.teacher_group_courses
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save!
      update_lecturer_status()
      flash[:notice] = "Vyučujúci #{@teacher.name} bol úspešne vytvorený"
      redirect_to @teacher
    else
      render 'new'
    end
  end

  ####
  @@lecture = 4.0
  @@classes = 2.0

  def show
    @total = 0

    wage = @teacher.wage_category.wage_per_hour

    @teacher.teacher_courses.each do |tc|
      if tc.is_lecturer
        @total += tc.course.lectures_weekly * wage * @@lecture
      end

      tc.course.groups.each do |group|
        if group.teacher_group_courses?(@teacher.id, tc.course_id)
          @total += tc.course.classes_weekly * wage * @@classes
          @total += tc.course.lab_classes_weekly * wage * @@classes
        end
      end
    end
  end

  def edit
    @tgc = @teacher.teacher_group_courses
  end

  def update
    if @teacher.update_attributes(teacher_params)
      update_lecturer_status()
      update_teacher_group_courses()
      flash[:notice] = "Vyučujúci #{@teacher.name} bol upravený"
      redirect_to edit_teacher_path(@teacher)
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy

    flash[:notice] = "Vyučujúci #{@teacher.name} bol vymazaný"
    redirect_to teachers_path
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :wage_category_id, :lecturer_ids, {course_ids: []})
  end

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end

  def update_lecturer_status
    ids = params[:teacher][:lecturer_ids]

    if ids.present?
      ids.map!(&:to_i)
      @teacher.teacher_courses.each do |course|
        course.is_lecturer = if ids.include?(course.course_id)
          true
        else
          false
        end

        course.save()
      end
    else
      @teacher.teacher_courses.each do |course|
        course.is_lecturer = false
        course.save
      end
    end
  end

  def update_teacher_group_courses
    @teacher.teacher_group_courses.each do |tgc|
      if !@teacher.course_ids.include?(tgc.course_id)
        tgc.destroy
      end
    end
  end

  # t.string :personal_number
  # t.string :name
  # t.boolean :is_lecturer, default: false
end
