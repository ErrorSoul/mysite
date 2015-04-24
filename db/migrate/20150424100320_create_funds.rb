class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.text :content
      t.string :name

      t.timestamps null: false
    end
  end
end
