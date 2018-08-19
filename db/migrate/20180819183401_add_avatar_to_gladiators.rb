class AddAvatarToGladiators < ActiveRecord::Migration[5.2]
  def change
    add_attachment :gladiators, :avatar
  end
end
