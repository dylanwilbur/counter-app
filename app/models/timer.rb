class Timer < ApplicationRecord
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
  
end
