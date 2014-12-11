class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  respond_to :html, :xml

  def index
    if current_user.permission == "admin"
      @categories = Category.all
    end
      respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    if current_user.permission == "admin"
      @category = Category.new(category_params)
      @category.save
    end
    respond_with(@category)
  end

  def update
    if current_user.permission == "admin"
      @category.update(category_params)
      respond_with(@category)
    end
  end

  def destroy
    if current_user.permission == "admin"
      @category.destroy
    end
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :value)
    end
end
