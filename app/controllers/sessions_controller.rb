class SessionsController < ApplicationController
  
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end
     login!
    render 'welcome/home'
  end
  
  def destroy
    session.clear
  end
  
  def auth
    request.env['omniauth.auth']
  end
  
  
end