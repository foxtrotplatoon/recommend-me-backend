class CreateReccs < ActiveRecord::Migration[5.2]
  def change
    create_table :reccs do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
