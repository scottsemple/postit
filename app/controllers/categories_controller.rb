class CategoriesController < ApplicationController
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)

    if @category.save
      redirect_to categories_path, notice: "Your category was created successfully."
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:category).permit!
    end
end