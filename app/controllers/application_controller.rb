class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  
   def current_user
     User.find_by(id: session[:user_id])
   end
 
   def logged_in?
     !!current_user
   end

   def routing_error(error = 'Routing error', status = :not_found, exception=nil)
     render_exception(404, "Routing Error", exception)
   end
 
 end
