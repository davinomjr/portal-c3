class AddUserToMaterials < ActiveRecord::Migration
  def change
    add_reference :materials, :user, index: true, foreign_key: true
  end
end
