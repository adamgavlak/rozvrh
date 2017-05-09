class ImportsController < ApplicationController

  def new
  end

  def import
    Group.import(params[:file])
    redirect_to groups_path, notice: "Skupiny boli importované"
  end

end
