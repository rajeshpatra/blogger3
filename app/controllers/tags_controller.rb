class TagsController < ApplicationController

	before_action :require_login, only: [:destroy]
	def require_login
		unless Author.count == 0 || current_user
			redirect_to login_path
			flash.notice = "You're not logged in. Login to access!"
			return false
		end
	end

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to tags_path
		flash.notice = "Tag #{@tag.name} deleted!"
	end

end
