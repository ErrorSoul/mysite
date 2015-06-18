class ChangeTypeToAssets < ActiveRecord::Migration
  def change
    change_column :assets, :name, :text
  end
end
