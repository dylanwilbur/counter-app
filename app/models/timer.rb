class Timer < ApplicationRecord
  #validates :time, presence: true
  before_create :elapsed_time
  before_save :elapsed_time
  
  def elapsed_time
    now = Time.now
    elapsed = (now-self.created_at).floor
    elapsed
  end
  
end
