class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :phone
      t.string :firm
      t.text :body

      t.timestamps null: false
    end
  end
end
