class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Skupina #{@group.group_number} bola úspešne vytvorená"
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update_attributes(group_params)
      flash[:notice] = "Skupina #{@group.group_number} bola upravená"
      redirect_to groups_path
    else
      render :edit
    end
  end

  def destroy
    @group.destroy

    flash[:notice] = "Skupina #{@group.group_number} bola vymazaná"
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:group_number, :student_count, course_ids: [])
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
