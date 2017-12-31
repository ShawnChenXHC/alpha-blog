class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params.inspect
    @article = Article.new(article_params)
    @article.save
    # Redirect to the "show" action and "show" template
    redirect_to articles_show(@article)
  end
  
  
  
  private
    # Method to whitelist the values passed in by the request
    def article_params
      # This is saying: From the params hash, get the value of associated with the key :article.This
      # The value should be a hash as well, so keep only the keys :title and :description
      params.require(:article).permit(:title, :description)
    end
end