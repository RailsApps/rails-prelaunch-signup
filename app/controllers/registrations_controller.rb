class RegistrationsController < Devise::RegistrationsController

  # ovverride #create to respond to AJAX with a partial
  def create
    build_resource
    if resource.save
      if resource.active_for_authentication?
        sign_in(resource_name, resource)
        (render(:partial => 'thankyou', :layout => false) && return)  if request.xhr?
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        expire_session_data_after_sign_in!
        (render(:partial => 'thankyou', :layout => false) && return)  if request.xhr?
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render :action => :new, :layout => !request.xhr?
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    '/thankyou.html'
  end

  def after_sign_up_path_for(resource)
    # the page new users will see after sign up (after launch, when no invitation is needed)
    redirect_to root_path
  end

end