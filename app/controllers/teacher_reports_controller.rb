class TeacherReportsController < ApplicationController
  def index
    @teacher = Teacher.find(params[:teacher_id])
  end

  def show
    @document = Document.find(params[:id])

    file = Rails.root.join("pdfs", @document.filename)

    send_file(file, filename: @document.filename, type: "application/pdf", disposition: 'inline')
  end

  #### Koeficienty
  @@lecture = 4.0
  @@classes = 2.0

  def create
    @teacher = Teacher.find(params[:teacher_id])
    filename = "#{@teacher.name.parameterize}-uvazky-#{Date.today}.pdf"

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

    if (! Document.find_by(filename: filename).present?)
      @teacher.documents << Document.create(filename: filename)
    end

    render pdf: filename,
           layout: 'pdf',
           template: 'teachers/show',
           encoding: 'utf-8',
           save_to_file: Rails.root.join('pdfs', filename)
  end

  def email
    @teacher = Teacher.find(params[:teacher_id])
    @document = Document.find(params[:report_id])
  end

  def email_send
    @teacher = Teacher.find(params[:teacher_id])
    @document = Document.find(params[:report_id])
    @body = params[:body]
    @subject = params[:subject]

    ReportMailer.mail_teacher_report(@teacher, @document, @subject, @body).deliver_later

    @document.sent_count += 1
    @document.save

    flash[:notice] = "Email bol úspešne odoslaný"

    redirect_to teacher_reports_path
  end

  def destroy
    @document = Document.find(params[:id])

    @document.destroy!

    redirect_to teacher_reports_path
  end
end
