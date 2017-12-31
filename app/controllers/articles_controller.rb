class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      # If the validation passed
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  
  
  private
    # Method to whitelist the values passed in by the request
    def article_params
      # This is saying: From the params hash, get the value of associated with the key :article.This
      # The value should be a hash as well, so keep only the keys :title and :description
      params.require(:article).permit(:title, :description)
    end
end