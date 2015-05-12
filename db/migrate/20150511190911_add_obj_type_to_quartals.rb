class AddObjTypeToQuartals < ActiveRecord::Migration
  def change
    add_column :quartals, :obj_type, :string
  end
end
