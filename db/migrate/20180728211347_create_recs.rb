class CreateRecs < ActiveRecord::Migration[5.2]
  def change
    create_table :recs do |t|
      #created on form sub
      t.string :name, null: false
      t.text :description, null: false

      #created from google maps api in sub page (optional)
      t.integer :latitude
      t.integer :longitude

      #created/added from users after creation
      has_many :ratings #user ratings of the rec
      has_many :suggestions #user to user suggestions for the rec
      has_many :comments #user comments on rec page

      t.timestamps
    end
  end
end
