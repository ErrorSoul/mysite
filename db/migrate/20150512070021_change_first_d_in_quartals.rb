class ChangeFirstDInQuartals < ActiveRecord::Migration
  def change
    change_column :quartals, :first_d,  :date
    change_column :quartals, :second_d,  :date
    change_column :quartals, :third_d,  :date
    change_column :quartals, :fourth_d,  :date
  end
end
