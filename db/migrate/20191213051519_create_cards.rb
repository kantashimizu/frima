class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :customer_id, foreign_key: true
      t.references :user, null: false
      t.references :card, foreign_key: true
      t.timestamps
    end
  end
end
