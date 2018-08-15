class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.string :action

      t.references :fight

      t.references :offense
      t.references :defense
      t.integer :damage

      t.timestamps
    end
  end
end
