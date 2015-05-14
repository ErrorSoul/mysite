class AddFirstDToQuartals < ActiveRecord::Migration
  def change
    add_column :quartals, :first_d, :datetime
    add_column :quartals, :second_d, :datetime
    add_column :quartals, :third_d, :datetime
    add_column :quartals, :fourth_d, :datetime
  end
end
