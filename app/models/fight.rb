class Fight < ApplicationRecord

  before_create :resolve

  belongs_to :home, class_name: "Gladiator"
  belongs_to :home_weapon, class_name: "Weapon", required: false
  belongs_to :away, class_name: "Gladiator"
  belongs_to :away_weapon, class_name: "Weapon", required: false

  belongs_to :winner, class_name: "Gladiator", required: false

  has_many :turns, dependent: :destroy

  validate :not_fighting_self
  validate :winner_must_participate

  def to_s
    "#{home} #{home_weapon.present? ? "[#{home_weapon}]" : ""} VS #{away} #{away_weapon.present? ? "[#{away_weapon}]" : ""}"
  end

  private

  def not_fighting_self
    errors.add(:away, I18n.t('fight.errors.not_fighting_self')) if home == away
  end

  def winner_must_participate
    errors.add(:away, I18n.t('fight.errors.winner_must_participate')) if winner.present? and ![home,away].include?(winner)
  end

  def resolve_turn turn_no, offense, defense, weapon
    if weapon.present?
      if turn_no % weapon.speed == 0
        dmg = weapon.damage
      end
    else
      dmg = offense.damage
    end


    if dmg
      defense.current_hp -= dmg
      turns.build action: 'hit', offense: offense, defense: defense, damage: dmg
    end
  end

  def resolve
    home.current_hp = home.max_hp
    away.current_hp = away.max_hp

    turn = 0

    while !home.dead? and !away.dead?
      home_hit_chance = home.hit_chance
      away_hit_chance = away.hit_chance

      if home_hit_chance == away_hit_chance
        turns.build action: 'miss'
      elsif home_hit_chance > away_hit_chance
        resolve_turn turn, home, away, home_weapon
      else
        resolve_turn turn, away, home, away_weapon
      end

      turn += 1
    end

    self.winner = home.dead? ? away : home
  end

end