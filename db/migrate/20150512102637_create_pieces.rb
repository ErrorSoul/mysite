class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.date :observ_date
      t.decimal :cost, precision: 10, scale: 2
      t.decimal :pure_cost, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
