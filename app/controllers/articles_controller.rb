class ArticlesController < ApplicationController
  # If any of the methods in :only is called, before executing, run set_article()
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def show
    #@article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
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
  
  def edit
    #@article = Article.find(params[:id])
  end
  
  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was succesfully destroyed"
    redirect_to articles_path
  end
  
  
  
  private
    # Method to whitelist the values passed in by the request
    def article_params
      # This is saying: From the params hash, get the value of associated with the key :article.This
      # The value should be a hash as well, so keep only the keys :title and :description
      params.require(:article).permit(:title, :description)
    end
  
    def set_article
      @article = Article.find(params[:id])
    end
      
end