class CreateDecks < ActiveRecord::Migration
  def up
    create_table :decks do |t|
      t.string :color, null: false
    end
  end
  def down
    drop_table :decks
  end
end
