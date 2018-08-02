class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :suggestion_comment
      t.boolean :rejected, default: false

      t.integer :recipient_id
      t.integer :recc_id

      t.timestamps
    end
  end
end
