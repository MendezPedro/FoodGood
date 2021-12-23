class UserMailer < ApplicationMailer
    default from: 'food94good@gmail.com'

    def welcome_email
      @user = params[:user]
      mail(to: @user.email, subject: 'Haz creado un nuevo local')
    end
    # class SendWeeklySummary
    #     def run
    #       User.find_each do |user|
    #         UserMailer.with(user: user).weekly_summary.deliver_now
    #       end
    #     end
    #   end
end
