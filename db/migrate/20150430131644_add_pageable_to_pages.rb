class AddPageableToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :pageable, polymorphic: true, index: true
  end
end
