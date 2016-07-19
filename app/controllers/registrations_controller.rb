class RegistrationsController < Devise::RegistrationsController
  
 	private

 	def sign_up_params
   		params.require(:user).permit(:name, :email,:password, :password_confirmation, )
 	end

 	def account_update_params
   		params.require(:user).permit(: :name, :email,:password, :password_confirmation, :current_password)
 	end

 	def edit
   		render layout: "application"
 	end


 	#protected
	#def after_sign_up_path_for(resource)
		#after_signup_path(:location)
	#end

	#def after_update_path_for(resource)
		#after_signup_path(:location)
	#end
	
end

