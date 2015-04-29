class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :asset
      t.string :type
      t.integer :page_id

      t.timestamps null: false
    end
  end
end
