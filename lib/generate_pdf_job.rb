class GeneratePdfJob < Struct.new(:doc_id)

  def perform
    av = ActionView::Base.new()
    av.view_paths = ActionController::Base.view_paths
    av.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper
    end

    total = 0
    lecture = Multiplier.find_by(name: 'Prednáška').value
    classes = Multiplier.find_by(name: 'Cvičenie').value
    labs = Multiplier.find_by(name: 'Laboratórne cvičenie').value
    weeks = 13

    teacher = doc.teacher
    teacher.teacher_courses.each do |tc|
      if tc.is_lecturer
        total += tc.course.lectures_weekly * lecture * weeks
      end

      tc.course.groups.each do |group|
        if group.teacher_group_courses?(teacher.id, tc.course_id)
          total += tc.course.classes_weekly * classes * weeks
          total += tc.course.lab_classes_weekly * labs * weeks
        end
      end
    end

    pdf_html = av.render(template: "teachers/_teacher.html.erb", layout: "layouts/pdf.html.erb", locals: {teacher: teacher, lecture: lecture, classes: classes, labs: labs, total: total, weeks: 13})

    doc_pdf = WickedPdf.new.pdf_from_string(pdf_html, page_size: 'A4')

    filename = doc.filename
    pdf_path = Rails.root.join('pdfs', filename)

    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end
  end

  def success(job)
    doc.update_attribute(:status, 'Vygenerovaný')
  end

  private

  def doc
    @doc = Document.find(doc_id)
  end
end