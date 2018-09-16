class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :h_name
      t.string :h_class
      t.string :h_game
      t.date :h_created_at
    end
  end
end
