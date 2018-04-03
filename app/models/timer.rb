class Timer < ApplicationRecord
  #validates :time, presence: true
  
  def initialize()
    @time = Time.now
  end
  
  def elapsed_time
    now = Time.now
    elapsed = (now-@start).floor
    this.time = elapsed
    elapsed
  end
end
