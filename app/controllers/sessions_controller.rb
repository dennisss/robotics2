class SessionsController < ApplicationController
	include SessionsHelper

  def new
		render 'new'
  end

  def create
		user = User.find_by_email(params[:session][:user_email])
		if user and user.authenticate(params[:session][:password]) 
			sign_in user
			redirect_to '/welcome/index'
		else
			logger.debug "hello" + user.email
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
  end

  def destroy
		sign_out
		redirect_to '/welcome/index'
  end
end
