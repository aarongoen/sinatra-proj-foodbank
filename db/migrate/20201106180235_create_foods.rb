class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :quantity
      t.string :measuring_unit
      t.timestamps null: false
    end
  end
end
