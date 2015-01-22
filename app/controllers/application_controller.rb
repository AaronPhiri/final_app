class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 add_flash_types :accessMessage ,:another_custom_type
add_flash_types :admin ,:another_custom_type
add_flash_types :adduser ,:another_custom_type

private
 def confirm_logged_in
 unless session[:user_id]
 		flash[:notice] = "please login.!"
 		redirect_to(:controller => "Access",:action => "login")
 		return false
	else
 		return true
	end
end



end
