class AddPeriodIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :period_id, :integer
  end
end
