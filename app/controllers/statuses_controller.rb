class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @statuses = current_user.statuses.all
    respond_with(@statuses)
  end

  def show
    respond_with(@status)
  end

  def new
    @status = Status.new
    respond_with(@status)
  end

  def edit
  end

  def create
    @status = current_user.statuses.build(status_params)
    @status.save
    respond_with(@status)
  end

  def update
    @status.update(status_params)
    respond_with(@status)
  end

  def destroy
    @status.destroy
    respond_with(@status)
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      allow = [:value, :user_id]
      params.require(:status).permit(allow)
    end
end
