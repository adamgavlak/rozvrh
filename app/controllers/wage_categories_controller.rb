class WageCategoriesController < ApplicationController
  before_action :find_wage_category, only: [:show, :edit, :update, :destroy]

  def index
    @wage_categories = WageCategory.all
  end

  def new
    @wage_category = WageCategory.new
  end

  def create
    @wage_category = WageCategory.new(wage_category_params)

    if @wage_category.save
      flash[:notice] = "Kategória úvazkov - #{@wage_category.title} bola úspešne vytvorená"
      redirect_to wage_categories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @wage_category.update_attributes(wage_category_params)
      flash[:notice] = "Kategória úvazkov - #{@wage_category.title} bola upravená"
      redirect_to wage_categories_path
    else
      render :edit
    end
  end

  def destroy
    @wage_category.destroy

    flash[:notice] = "Kategória úvazkov - #{@wage_category.title} bola vymazaná"
    redirect_to wage_categories_path
  end

  private
  def wage_category_params
    params.require(:wage_category).permit(:title, :wage_per_hour)
  end

  def find_wage_category
    @wage_category = WageCategory.find(params[:id])
  end

  # Migration table:
  # t.string :title
  # t.float :wage_per_hour
end
