 class UserMailer < ActionMailer::Base
  default from: "admin@admin.com"

    def delete_notification(user)
      @user = user
      # @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Your Rotten Mangoes account was deleted')
    end
  end
