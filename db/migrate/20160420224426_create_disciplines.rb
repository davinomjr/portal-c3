class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name,     default: "", null: false
      t.string :code,         default: "", null: false
      t.string :link         
      t.integer :credit,         null: false
      t.integer :hours         
      t.integer :semester,         null: false
      t.integer :shift,         null: false

      t.timestamps null: false
    end
  end
end
