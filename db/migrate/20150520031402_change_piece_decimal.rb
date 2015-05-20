class ChangePieceDecimal < ActiveRecord::Migration
  def change
    change_column :pieces, :cost, :decimal,  precision: 14, scale: 3
    change_column :pieces, :pure_cost, :decimal,  precision: 14, scale: 3
  end
end
