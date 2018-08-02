class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :suggestion_comment
      t.boolean :rejected, default: false

      t.belongs_to :user, index: true
      t.belongs_to :recc, index: true

      t.timestamps
    end
  end
end
