class AddFundIdToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :fund_id, :integer
  end
end
