class SessionsController < ApplicationController

  def new
    @allCategories = Category.all
  end

  def create
    @allCategories = Category.all
    user = User.find_by(email: params[:session][:email].downcase)
    #logger.debug "Found User ID : #{user.id}"
    if user && user.authenticate(params[:session][:password])
      #log_in user
      #logger.debug "logged in User with email #{user.email}"
      session[:user_id] = user.id
      #logger.debug "Session User id: #{session[:user_id]}"
      redirect_to products_path      #login etc.
   else
     flash.now[:danger] = 'Sorry! Falsche Email/Password Kombination.'
     render 'new'
   end
 end

  def destroy
    log_out
    redirect_to root_url
  end

end
