class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(
    	title: params[:article][:title],
    	body: params[:article][:body])
  		@article.save
  		flash.notice = "Article '#{@article.title}' created!"
  		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' deleted!"
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(title: params[:article][:title], body:params[:article][:body])
		flash.notice = "Article '#{@article.title}' Updated!"
		redirect_to article_path
	end
end
