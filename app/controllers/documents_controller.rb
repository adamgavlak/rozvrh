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

end