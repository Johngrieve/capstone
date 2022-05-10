class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :duelist1
      t.string :duelist2
      t.string :sentinel
      t.string :initiator
      t.string :controller

      t.timestamps
    end
  end
end
