namespace :email do
  desc "Send a mail to reconfirm after 3 months on waiting list"
  task three_months_confirm: :environment do
    i = 0
    Request.confirmed.each do |request|
      next if request.user.confirmed_at + 90.days > Date.today

      # send mail
      request.update(status: "pending")
      request.user.update(confirmed_at: nil)
      i += 1
    end
    puts "#{i} mail(s) sended."
  end
end
