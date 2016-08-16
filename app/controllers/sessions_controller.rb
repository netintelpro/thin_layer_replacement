class SessionsController < ApplicationController

  def new

  end

  def create
    session[:user] = {}
    users = YAML::load(File.open(USER_DATA_PATH)) || []
    users.each do |user|
      if params[:session][:email] == user[:email] && Digest::SHA1.hexdigest(params[:session][:password]) == user[:password]
        session[:user][:email] = user[:email]
        redirect_to root_url, notice: "You are signed in now." and return
      end
    end
    redirect_to :back, notice: "Email or password is not valid"
  end

  def destroy
    session[:user] = nil
    redirect_to root_url, notice: "You are signed out successfully."
  end

 	private
 	def session_params
   		params.require(:session).permit(:email,:password)
 	end
end

