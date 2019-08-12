class AddKoanNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :koan_number, :integer
  end
end
