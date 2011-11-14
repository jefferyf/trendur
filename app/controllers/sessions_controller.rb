class SessionsController < Devise::SessionsController
  
  #Overide some of Devise sessions controller functionality
  def new
    redirect_to '/auth/twitter' and return
  end
    
end