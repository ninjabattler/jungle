class Admin::CategoriesController < ApplicationController
  include HttpAuthConcern
  user = ENV['BASIC_AUTH_USERNAME']
  pass = ENV['BASIC_AUTH_PASSWORD']
  http_basic_authenticate_with name:  user, password: pass
  def index
    @categories = Category.joins("LEFT OUTER JOIN products ON categories.name = products.name").order(id: :desc).group(:id)
  end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
