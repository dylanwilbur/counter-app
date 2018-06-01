# Preview all emails at http://localhost:3000/rails/mailers/timer_mailer
class TimerMailerPreview < ActionMailer::Preview
  # Preview this email at
  # https://rails-tutorial-dwilbur.c9users.io/rails/mailers/timer_mailer/log_in_code
  def log_in_code
    timer = Timer.first
    TimerMailer.log_in_code(timer)
  end
end
