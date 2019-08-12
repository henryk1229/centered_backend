class ChangeIntegerLimitInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :koan_number, :integer, limit: 8
  end
end
