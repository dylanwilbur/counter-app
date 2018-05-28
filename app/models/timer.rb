require 'digest/sha1'

class Timer < ApplicationRecord
  attr_accessor :remember_token
  before_save :process_input
  #regex allows for empty strings- maybe will fix later?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z|\A\z/i
  validates :email, allow_nil: true, length: { maximum: 255 }, 
                                    format: { with: VALID_EMAIL_REGEX }
  
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
  
  private
  
    def process_input
      if !email.blank?
        email.downcase!
      else
        self.email = nil
      end
    end
        
        
end
