class Gladiator < ApplicationRecord

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

  def fight opponent
    if self == opponent
      raise
    end

    @current_hp = max_hp
    opponent.current_hp = opponent.max_hp

    puts @current_hp
    puts opponent.current_hp

    turns = []

    while !dead? and !opponent.dead?
      home_hit_chance = hit_chance
      away_hit_chance = opponent.hit_chance

      if home_hit_chance == away_hit_chance
        turns.append [:miss, nil, nil, nil]
      elsif home_hit_chance > away_hit_chance
        dmg = damage
        opponent.current_hp -= dmg
        turns.append [:hit, self.to_s, opponent.to_s, dmg]
      else
        dmg = opponent.damage
        @current_hp -= dmg
        turns.append [:hit, opponent.to_s, self.to_s, dmg]
      end
    end

    winner = dead? ? opponent : self

    Fight.create home: self, away: opponent, winner: winner

    turns
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