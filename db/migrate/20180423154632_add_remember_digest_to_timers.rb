class AddRememberDigestToTimers < ActiveRecord::Migration[5.1]
  def change
    add_column :timers, :remember_digest, :string
  end
end
