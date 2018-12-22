class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log_in user
      logger.debug "logged in User with email #{user.email}"
      logger.debug "User ID: #{user.id}"
      session[:user_id] = user.id
      logger.debug "Session User id: #{session[:user_id]}"
      redirect_to products_path      #login etc.
   else
     flash.now[:danger] = 'Invalid email/password combination'
     render 'new'
   end
 end

  def destroy
    log_out
    redirect_to root_url
  end

end
