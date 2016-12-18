class Api::GroupsController < Api::ApplicationController
  before_action :find_group, only: [:show, :update, :destroy]

  def index
    @groups = group.all
    render json: @groups
  end

  def create
    @group = group.new(group_params)

    if @group.save
      render nothing: true, status: 201
    else
      render nothing: true, status: 400
    end
  end

  def show
    render json: @group
  end

  def update
    if @group.update_attributes(group_params)
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  def destroy
    if @group.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 400
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_number, :student_count)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
