class AdministratorPageController < ApplicationController
layout 'administrato_page'
  def index
  redirect_to(:action => "managerPage")
  end

  def managerPage
 				@active = User.find(session[:user_id]).try :touch
  end
end
