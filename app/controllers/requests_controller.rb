class RequestsController < ApplicationController
  def accept
    @request = Request.find(params[:request_id])

    @request.accept!

    MyMailer.welcome(@request).deliver_now

    redirect_to workstation_path(@request.workstation)
  end
end
