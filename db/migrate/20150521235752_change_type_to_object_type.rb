
class ChangeTypeToObjectType < ActiveRecord::Migration
  def change
    rename_column :posts, :type, :object_type  
 end
end
