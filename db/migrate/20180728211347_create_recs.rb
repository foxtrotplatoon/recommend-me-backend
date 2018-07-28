class CreateRecs < ActiveRecord::Migration[5.2]
  def change
    create_table :recs do |t|
      #created on form sub
      t.string :name, null: false
      t.text :description, null: false

      #created from google maps api in sub page (optional)
      t.integer :latitude
      t.integer :longitude
      

      t.timestamps
    end
  end
end
