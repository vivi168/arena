class Gladiator < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_create :compute_stats

  has_many :home_fights, class_name: "Fight", foreign_key: :home, dependent: :nullify
  has_many :away_fights, class_name: "Fight", foreign_key: :away, dependent: :nullify
  has_many :won_fights, class_name: "Fight", foreign_key: :winner, dependent: :nullify

  validates :name, presence: true

  attr_accessor :current_hp

  def to_s
    name
  end

  def hit_chance
    rand(1..6) + rand(1..6) + self.agility
  end

  def damage
    rand(2..self.strength)
  end

  def dead?
    @current_hp <= 0
  end

  private

  def gen_stat
    rand(1..6) + 6
  end

  def compute_stats
    self.stamina = gen_stat
    self.strength = gen_stat
    self.agility = gen_stat

    self.max_hp = (self.stamina + rand(1..6) + rand(1..6)) * 10
  end

end
