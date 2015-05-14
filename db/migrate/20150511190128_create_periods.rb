class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :fund_id

      t.timestamps null: false
    end
  end
end
