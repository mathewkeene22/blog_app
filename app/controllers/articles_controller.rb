class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "The article has been created huzzah"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article
    else
      flash.now[:danger] = "Article has not been updated"
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article was not deleted"
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
