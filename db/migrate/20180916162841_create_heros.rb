class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :h_name
      t.references :hero_class, index: true
      t.references :game, index: true
      t.date :h_created_at
    end
  end
end
