class Timer < ApplicationRecord
  #validates :time, presence: true
  before_create :elapsed_time
  before_save :elapsed_time
  
  def initialize()
    @start = Time.now
  end
  
  def elapsed_time
    now = Time.now
    elapsed = (now-@start).floor
    #self.time = elapsed
    elapsed
  end
end
