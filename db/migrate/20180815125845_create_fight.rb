class CreateFight < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :home
      t.references :away

      t.references :winner

      t.timestamps
    end
  end
end
