class RegistrationsController < Devise::RegistrationsController

  protected
  # redirect to user show afte sign up 
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
end
