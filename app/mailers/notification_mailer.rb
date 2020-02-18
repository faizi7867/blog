class NotificationMailer < ApplicationMailer
    def welcome_email(email)
        @greeting = "Hi"
        @email = email
        mail to: "#{@email}", subject: "Welcome Email"
    end
end
