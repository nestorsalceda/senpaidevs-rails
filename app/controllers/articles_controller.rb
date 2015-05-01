class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.json { render json: @articles }
      format.html { render }
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
