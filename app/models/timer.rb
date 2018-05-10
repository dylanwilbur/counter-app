require 'digest/sha1'

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
  
  def Timer.digest(input)
    Digest::SHA1.hexdigest(input)
  end
  
  def Timer.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Timer.new_token
    update_attribute(:remember_digest, Timer.digest(remember_token))
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
