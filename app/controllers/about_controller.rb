class AboutController < ApplicationController
  before_action :authenticate_user!
  def index
  	
  	@contacts = current_user.contacts.all
  	@statuses = current_user.statuses.all

  end
end
