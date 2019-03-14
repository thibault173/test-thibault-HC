class WorkstationsController < ApplicationController
  def index
    @workstations = Workstation.all
  end

  def show
    @workstation = Workstation.find(params[:id])
    @requests = @workstation.requests
  end
end
