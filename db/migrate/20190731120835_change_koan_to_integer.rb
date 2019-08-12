class ChangeKoanToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :koan_number, 'integer USING CAST(koan_number AS integer)'
  end
end
