class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment_text, null: false, allow_blank: false

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
