class ArticlesController < ApplicationController

	include ArticlesHelper

	before_action :require_login, only: [:new, :create, :edit, :destroy]
	def require_login
		unless Author.count == 0 || current_user
			redirect_to login_path
			flash.notice = "You're not logged in. Login to access!"
			return false
		end
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
	
	def new
		@article = Article.new
	end

	def create
		# @article = Article.new
		# @article.title = params[:article][:title]
		# @article.body = params[:article][:body]

		# or another way
		# @article = Article.new(
		# 	title: params[:article][:title],
		# 	body: params[:article][:body])
		
		# or
		@article = Article.new(article_params)
		@article.save
		redirect_to article_path(@article)
		flash.notice = "Article '#{@article.title}' Created!"
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		redirect_to article_path(@article)
		flash.notice = "Article '#{@article.title}' Updated!"
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
		flash.notice = "Article '#{@article.title}' Deleted!"
	end

end
