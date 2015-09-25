class ChangeDateToQuartals < ActiveRecord::Migration
  def change
	change_column :quartals, :first_d,  :datetime
    change_column :quartals, :second_d,  :datetime
    change_column :quartals, :third_d,  :datetime
    change_column :quartals, :fourth_d,  :datetime
  end
end
