class Gladiator < ApplicationRecord

  before_create :compute_stats

  has_many :home_fights, class_name: "Fight", foreign_key: :home
  has_many :away_fights, class_name: "Fight", foreign_key: :away
  has_many :won_fights, class_name: "Fight", foreign_key: :winner

  validates :name, presence: true

  attr_accessor :current_hp

  def to_s
    name
  end

  private

  def gen_stat
    rand(1..6) + 6
  end

  def compute_stats
    self.stamina = gen_stat
    self.strength = gen_stat
    self.agility = gen_stat

    self.max_hp = self.stamina + rand(1..6) + rand(1..6)
  end
end