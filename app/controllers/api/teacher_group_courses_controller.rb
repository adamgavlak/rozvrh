class Api::TeacherGroupCoursesController < Api::ApplicationController

  def create
    teacher_id = params[:teacher_id].to_i
    course_id = params[:course_id].to_i
    group_id = params[:group_id].to_i

    puts params.inspect

    tgc = TeacherGroupCourse.where(teacher_id: teacher_id, course_id: course_id, group_id: group_id).first_or_initialize

    if tgc.save!
      render json: tgc, status: 201
    else
      render json: {error: "already exists"}, status: 200
    end
  end

  def destroy
    teacher_id = params[:teacher_id].to_i
    course_id = params[:course_id].to_i
    group_id = params[:group_id].to_i

    tgc = TeacherGroupCourse.where(teacher_id: teacher_id, course_id: course_id, group_id: group_id).first

    if tgc != nil
      tgc.destroy!

      render json: {error: "destroyed"}, status: 200
    end
  end
end