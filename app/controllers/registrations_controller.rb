class RegistrationsController < ApplicationController

  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.save(@user.attributes.reject!{|attr| attr == :errors || attr == :role})
      session[:user] = {}
      session[:user][:email] = @user.email
      redirect_to root_url, notice: "Registration successful."
    else
      render "new", :layout => false
    end
  end

 	private
 	def user_params
   		params.require(:user).permit(:name, :email,:password, :password_confirmation, :current_password)
 	end

 	def edit
   		render layout: "application"
 	end
end

