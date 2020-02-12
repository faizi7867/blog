class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def show
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new
    @article.title = params['article']['title']
    @article.body = params['article']['body']
    @article.publish_date = params['article']['publish_date']
    @article.feature_image_url = params['article']['feature_image_url']
    @article.is_published = params['article']['is_published']
    @article.category_id = params['article']['category_id']
    if @article.save
      redirect_to articles_path 
    end
    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params['article']['title']
    @article.body = params['article']['body']
    @article.publish_date = params['article']['publish_date']
    @article.feature_image_url = params['article']['feature_image_url']
    @article.is_published = params['article']['is_published']
    @article.category_id = params['article']['category_id']
    if @article.save
      redirect_to articles_path 
    end


  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
        redirect_to articles_path
      else
        redirect_to categories_path
      end
  end
  
end