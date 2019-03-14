class WorkstationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @workstations = Workstation.all
  end

  def show
    @workstation = Workstation.find(params[:id])
    @requests = @workstation.requests
  end
end
