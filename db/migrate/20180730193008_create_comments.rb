class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment_text, null: false

      t.belongs_to :user, index: true
      t.references :recc, index: true, foreign_key: "recc_id"
      t.timestamps
    end
  end
end
