class CategoriesController < ApplicationController
  load_and_authorize_resource
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
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])
    @category.name = params['category']['name']
    @category.description = params['category']['description']
    if @category.save
      redirect_to category_path
    end
  end

  def show
    @category = Category.friendly.find(params[:id])
  end


  def destroy
    @category = Category.friendly.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    else
      redirect_to categories_
    end
  end
end