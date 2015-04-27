class AddInfoToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :info, :text
    add_column :funds, :strategy, :text
    add_column :funds, :condition, :text
  end
end
