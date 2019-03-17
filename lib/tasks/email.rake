namespace :email do
  desc "Send a mail to reconfirm after 3 months on waiting list"
  task three_months_confirm: :environment do
    i = 0
    Request.confirmed.each_with_index do |request, index|
      next if request.user.confirmed_at + 90.days > Date.today

      request.update!(status: "pending")
      request.user.update!(confirmed_at: nil)
      MyMailer.reconfirmation_instructions(request.user, index + 1).deliver_now
      i += 1
    end
    puts "#{i} mail(s) sended."
  end
end
