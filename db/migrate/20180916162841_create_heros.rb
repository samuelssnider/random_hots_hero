class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :class
      t.string :game
      t.date :created_at
    end
  end
end
