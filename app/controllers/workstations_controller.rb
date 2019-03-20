class WorkstationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @workstations = Workstation.all
  end

  def show
    @workstation = Workstation.find(params[:id])
    requests_confirmed
    @requests_accepted = Request.accepted.where(workstation: @workstation)
  end

  def accept_first
    @workstation = Workstation.find(params[:workstation_id])

    unless requests_confirmed.empty?
      @requests_confirmed.first.accept!
    end

    redirect_to workstation_path(@workstation)
  end

  private

  def requests_confirmed
    @requests_confirmed = Request.confirmed.where(workstation: @workstation)
  end
end
