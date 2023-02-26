class CreateBicycles < ActiveRecord::Migration[7.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.string :style
      t.float :price
      t.string :description
      t.text :image

      t.timestamps
    end
  end
end
