class CreateReccs < ActiveRecord::Migration[5.2]
  def change
    create_table :reccs do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :location

      t.references :user, index: true, foreign_key: true
      t.integer :rating_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
