class TimerMailer < ApplicationMailer
  def log_in_code(timer)
    @timer = timer
    mail to: timer.email, subject: "Account code"
  end
end
