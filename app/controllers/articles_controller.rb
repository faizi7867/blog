class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @postcomment = Postcomment.new
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params['article']['title']
    @article.body = params['article']['body']
    @article.category_id = params['article']['category_id']
    @article.publish_date = params['article']['publish_date']
    @article.feature_image_url = params['article']['feature_image_url']
    if @article.publish_date <= Date.today
      @article.is_published = true
    elsif @article.publish_date > Date.today
      @article.is_published = false
    end
    @article.user_id = current_user.id
    if @article.save
      if not current_user.permissions.exists?(role_id:2) and not current_user.permissions.exists?(role_id:1)
        @permission = Permission.new
        @permission.user_id = current_user.id
        @permission.role_id = 2
        if not @permission.save
          redirect_to errors_path
        end
      end
      redirect_to articles_path  
    else
      redirect_to article_new_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params['article']['title']
    @article.body = params['article']['body']
    @article.category_id = params['article']['category_id']
    @article.publish_date = params['article']['publish_date']
    if not params['article']['feature_image_url'].nil?
      @article.feature_image_url = params['article']['feature_image_url']
    end
    if @article.publish_date <= Date.today
      @article.is_published = true
    elsif @article.publish_date > Date.today
      @article.is_published = false
    end
    if @article.save
      redirect_to articles_path
    else
      redirect_to article_edit_path
    end
  end

  def destroy
    @article=Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    end
  end

end