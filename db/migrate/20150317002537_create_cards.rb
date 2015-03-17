class CreateCards < ActiveRecord::Migration
  def up
    create_table :cards do |t|
      t.string :color, null: false
      t.string :text, null: false
    end
  end
  def down
    drop_table :cards
  end
end
