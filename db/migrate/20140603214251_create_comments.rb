class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.text :message
      t.string :rating

      t.integer :user_id
      t.integer :spot_id
      t.timestamps
    end

    add_index :comments, [:user_id, :spot_id]
    add_index :comments, :spot_id
  end
end
