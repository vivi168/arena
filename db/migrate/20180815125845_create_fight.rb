class CreateFight < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.belongs_to :home, index: true
      t.belongs_to :home_weapon, index: true

      t.belongs_to :away, index: true
      t.belongs_to :away_weapon, index: true

      t.belongs_to :winner

      t.timestamps
    end
  end
end
