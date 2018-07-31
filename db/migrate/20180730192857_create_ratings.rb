class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :score, null: false

      t.belongs_to :user, index: true
      t.references :recc, index: true
      t.timestamps
    end
  end
end
