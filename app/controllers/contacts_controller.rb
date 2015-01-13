class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  respond_to :html

  def index
    @contacts = current_user.contacts.all
    respond_with(@contacts)
  end

  def show
    @status_id = @contact.status_id
    @status = Status.where(status_id: @status_id)
    respond_with(@contact)
     
  end

  def new
    @contact = Contact.new
    @statuses = current_user.statuses.all
    @user = current_user 
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:status_id, :value, :name, :note, :assigned_to, :email, :phone, :user_id)
      
    end
   


end
