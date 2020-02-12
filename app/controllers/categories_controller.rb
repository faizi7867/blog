class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new
    @category.name = params['category']['name']
    @category.description = params['category']['description']
    if @category.save
      redirect_to categories_path 
    end
  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params['category']['name']
    @category.description = params['category']['description']
    if @category.save
      redirect_to category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end


  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    else
      redirect_to categories_
    end
  end
end