class AuthorSessionsController < ApplicationController

	# before_action :require_params ### allow all methods need to be accessible to allow login and logout
	# def require_params

	# end

	def new

	end

	def create
		if login(params[:email], params[:password])
			redirect_back_or_to(articles_path, notice: "Logged in successfully.")
		else
			flash.now.alert = "Login failed."
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(:authors, notice: "Logged out!")
	end
end
