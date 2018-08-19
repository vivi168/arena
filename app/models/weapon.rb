class Weapon < ApplicationRecord

  validate :damage_in_range

  def to_s
    "#{name}"
  end

  def damage
    rand(damage_low..damage_high)
  end

  private

  def damage_in_range
    errors.add(:damage_low, I18n.t('weapon.errors.damage_in_range')) if damage_low >= damage_high
  end

end