class CreatePetwalks < ActiveRecord::Migration
  def change
    create_table :petwalks do |t|
      t.references :walk, index: true, foreign_key: true
      t.references :pet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
