class CreateQuartals < ActiveRecord::Migration
  def change
    create_table :quartals do |t|
      t.string :first_q
      t.string :second_q
      t.string :third_q
      t.string :fourth_q
      t.integer :period_id

      t.timestamps null: false
    end
  end
end
