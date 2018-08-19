class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.string :action

      t.belongs_to :fight, index: true

      t.belongs_to :offense, index: true
      t.belongs_to :defense, index: true
      t.integer :damage

      t.timestamps
    end
  end
end
