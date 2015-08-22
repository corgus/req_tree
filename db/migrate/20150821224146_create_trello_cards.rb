class CreateTrelloCards < ActiveRecord::Migration
  def change
    create_table :trello_cards do |t|
      t.integer :card_id
      t.string :shortlink

      t.timestamps null: false
    end
  end
end
