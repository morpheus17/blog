class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:id)
  end

  def new
  end

  def edit
    @articles = Article.all
    @id = params[:id].to_i
  end

  def create
    # @article = Article.new
    # @article.title = params[:title]
    # @article.content = params[:content]

    # if @article.save
    if Article.create(title: params[:title], author: 'JC', content: params[:content])
      redirect_to articles_path, notice: "back to index"
    else
      render :new
    end
  end

  def update
    article = Article.find(params[:id].to_i)
    if article.update(title: params[:title], content: params[:content])
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id].to_i)
    article.destroy
    redirect_to articles_path, alert: "blog post deleted"
  end
end
