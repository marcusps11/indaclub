class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate
  helper_method :owns_event?

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def logged_in?
     !!current_user
   end

   def authenticate
     unless logged_in?
       flash[:error] = "You must be logged in to access the content of this website"
       redirect_to "/"
     end
   end

   def authenticate_user(user)
       if user != current_user
         flash[:error] = "You are not authorized to do that."
         redirect_to root_path
       else 
         true
       end
     end
  
end
