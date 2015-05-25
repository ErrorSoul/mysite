class AddObjTypeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :obj_type, :string
  end
end
