class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  
  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.new(params)
    if @article.save
      render json: { article: article, status: :ok }
    else 
      render json: { error: "Article not valid", status: 402 }
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end