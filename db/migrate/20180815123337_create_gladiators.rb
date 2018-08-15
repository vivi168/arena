class CreateGladiators < ActiveRecord::Migration[5.2]
  def change
    create_table :gladiators do |t|
      t.string :name

      t.integer :max_hp

      t.integer :stamina
      t.integer :strength
      t.integer :agility

      t.timestamps
    end
  end
end
