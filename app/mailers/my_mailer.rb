class MyMailer < ApplicationMailer
  def reconfirmation_instructions(resource, position)
    @resource = resource
    @token = @resource.confirmation_token
    @position = position
    mail(to: @resource.email, subject: 'Mail of reconfirmation')
  end

  def welcome(request)
    @request = request
    mail(to: @request.user.email, subject: 'Welcome !')
  end
end
