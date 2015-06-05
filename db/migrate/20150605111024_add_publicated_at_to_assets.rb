class AddPublicatedAtToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :publicated_at, :datetime
  end
end
