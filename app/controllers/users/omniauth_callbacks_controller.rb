 class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def linkedin
    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in @user, :event => :authentication
      redirect_to root_url, :notice => "You have been connected with Linkedin successfully!!"
    else
      redirect_to root_url, :notice => "Something went wrong!"
    end
  end


 end