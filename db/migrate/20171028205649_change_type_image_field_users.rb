class ChangeTypeImageFieldUsers < ActiveRecord::Migration[5.1]
  def change
	change_column :users, :image, :text
  end
end
