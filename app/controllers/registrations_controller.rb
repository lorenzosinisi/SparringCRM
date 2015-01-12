class RegistrationsController < Devise::RegistrationsController
   def new
    super # no customization, simply call the devise standard implementation
  end

  def create
     super
    if @user.save
      
      #sign in and verify user
      
      sign_in @user
      @user = current_user
      
      Status.create(value: 'Lead', user_id: @user.id)
      Status.create(value: 'Contacted', user_id: @user.id)
      Status.create(value: 'Demo', user_id: @user.id)
      Status.create(value: 'Negotiation', user_id: @user.id)
      Status.create(value: 'Closed - Lost', user_id: @user.id)
      Status.create(value: 'Closed - Won', user_id: @user.id)

      flash[:notice] = "Thanks for becoming our member!"

    else
      render :action => :new
    end
  end

  def update
  	super
  end

  protected

  def after_sign_up_path_for(resource)
    new_contact_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_contact_path
  end
 
  private
  
   def status_params
      allow = [:value, :user_id]
      params.require(:status).permit(allow)
    end

end
