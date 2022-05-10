class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :valorantName
      t.string :character
      t.string :role
      t.string :rank

      t.timestamps
    end
  end
end
