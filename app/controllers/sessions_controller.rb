class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			if user.deactivated?
				redirect_to inactive_path(id: user.id)
			else
				sign_in user
				if user.admin?
					redirect_to dashboard_url
				else
					redirect_back_or user
				end
			end
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
