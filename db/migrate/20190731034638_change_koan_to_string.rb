class ChangeKoanToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :koan_number, :string
  end
end
