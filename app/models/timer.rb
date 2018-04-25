class Timer < ApplicationRecord
  attr_accessor :remember_token
  #validates :time, presence: true
  #before_create :elapsed_time
  #before_save :elapsed_time
  
  def elapsed_time
    if !self.nil?
      self.time = (Time.now-self.created_at).floor
      self.time
    else
      0
    end
  end
  
  def Timer.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Timer.new_token
    update_attribute(:remember_digest, Timer.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
end
