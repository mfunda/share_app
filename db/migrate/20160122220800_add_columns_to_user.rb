class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :datetime
    add_column :users, :sex, :boolean
  end
end
