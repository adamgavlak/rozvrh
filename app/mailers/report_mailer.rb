class ReportMailer < ApplicationMailer

  def mail_teacher_report(teacher, document, subject, body)
    @teacher = teacher
    @body = body

    attachments[document.filename] = File.read(Rails.root.join("pdfs", document.filename))

    mail(to: @teacher.email, subject: subject)
  end
end
