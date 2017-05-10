class ImportsController < ApplicationController

  # Formulár importu skupín
  def new
  end

  # Import skupín
  def import
    Group.import(params[:file])
    redirect_to groups_path, notice: "Skupiny boli importované"
  end

end
