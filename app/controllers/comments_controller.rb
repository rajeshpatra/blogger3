class CommentsController < ApplicationController

	include CommentsHelper

	def create
		# @comment = Comment.new
		# @comment.author_name = params[:comment][:author_name]
		# @comment.body = params[:comment][:body]

		# @comment = Comment.new(
		# 	author_name: params[:comment][:author_name],
		# 	body: params[:comment][:body])

		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.save
		redirect_to article_path(@comment.article)
	end
end
