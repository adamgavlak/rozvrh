class DocumentsController < ApplicationController

  def show
    @teacher = Teacher.find(params[:filename])
    filename = "#{@teacher.name.parameterize}-uvazky-#{Date.today}.pdf"

    render pdf: filename,
           layout: 'pdf',
           template: 'teachers/show',
           encoding: 'utf-8',
           save_to_file: Rails.root.join('pdfs', filename)
  end

  def test
    @teacher = Teacher.find(params[:id])
    filename = "#{@teacher.name.parameterize}-uvazky-#{Date.today}.pdf"
    doc = Document.find_by(filename: filename)

    if !doc.present?
      doc = Document.create(filename: filename)
      @teacher.documents << doc
    end

    Delayed::Job.enqueue ::GeneratePdfJob.new(doc.id)


  end

end