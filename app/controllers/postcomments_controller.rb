class PostcommentsController < ApplicationController
  def show
    @postcomments = Postcomment.new
    # @postcomments.article_id = params[:id]
  end
  
  def index
  end

  def create
    # binding.pry
    @postcomments = Postcomment.new
    @postcomments.title = params['postcomment']['title']
    @postcomments.body = params['postcomment']['body']
    @postcomments.article_id = params['postcomment']['article_id']
    @postcomments.user_id = current_user.id
    if @postcomments.save
      #notice = "Your postcomments added successfully"
      flash.notice = "Your Comment has been added"
      redirect_to article_path(@postcomments.article_id)
    end
  end

  def new
    @postcomments = Postcomment.new
  end

  def edit
    @postcomments = Postcomment.find(params[:id])
  end

  def destroy
    @postcomments = Postcomment.find(params[:id])
    @id = @postcomments.article_id
    if @postcomments.destroy
      redirect_to article_path(@id)
    end
  end

  def update
    @postcomments = Postcomment.find(params[:id])
    @postcomments.title = params['postcomment']['title']
    @postcomments.body = params['postcomment']['body']
    @postcomments.article_id = params['postcomment']['article_id']
    @postcomments.user_id = current_user.id
    if @postcomments.save
      flash.notice = "Your Comment has been edited"
      redirect_to article_path(@postcomments.article_id)
    end
  end

end