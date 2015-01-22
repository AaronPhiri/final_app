class AccessController < ApplicationController
 before_action :confirm_logged_in,:except => [:login,:attempt_login,:logout]


  layout 'access'
  def index
    redirect_to(:action => "login")
  end

  def login
   @users = User.all
  end

 def attempt_login
 if params[:username].present? && params[:password].present?
   @found_user = User.where(:username => params[:username]).first
    if @found_user
       @authorized_user = @found_user.authenticate(params[:password])
    end
  end
 if @authorized_user
   	session[:user_id]= @authorized_user.id
					#@have = User.find( session[:user_id])
					# @have .update(:user_online => 1)
				 	#@have.save
   	session[:username] = @authorized_user.username
   @authorized_user.try :touch
    realtime = Time.now.strftime("%Y %B %d,%H:%M")
    
    userscount = User.online.count
  
		online =Online.new(:time => realtime,:number => userscount)
		online.save
		 if @authorized_user.system
		 flash[:admin] = "You are now logged in to adminstrator page"
		 redirect_to(:controller =>"Administrator_page",:action => "index")
		 else
			flash[:notice] = "You are now logged in to indicators page"
		  redirect_to(:controller=> "indicators",:action=> "index")
		 end
 else
  flash[:accessMessage] = "Invalid username/password combination....try again!"
  redirect_to(:action => "login")
 end
 end

 def logout
 @found_user = User.find(session[:user_id])
				 #@found_user.update(:user_online => 0)
					#@found_user.save
		session[:user_id]= nil
   session[:username] = nil
  	flash[:accessMessage] = "You are now logged out"
 redirect_to(:action => "login")
 end



end
