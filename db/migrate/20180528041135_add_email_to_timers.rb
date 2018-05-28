class AddEmailToTimers < ActiveRecord::Migration[5.1]
  def change
    add_column :timers, :email, :string
  end
end
