class UserMailer < ApplicationMailer
    default from: 'food94good@gmail.com'

    def welcome_email
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: "food94good@gmail.com", subject: 'Welcome to My Awesome Site')
    end
    # class SendWeeklySummary
    #     def run
    #       User.find_each do |user|
    #         UserMailer.with(user: user).weekly_summary.deliver_now
    #       end
    #     end
    #   end
end
