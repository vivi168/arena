class Fight < ApplicationRecord

  before_create :resolve

  belongs_to :home, class_name: "Gladiator"
  belongs_to :away, class_name: "Gladiator"
  belongs_to :winner, class_name: "Gladiator", required: false

  has_many :turns, dependent: :destroy

  validate :not_fighting_self
  validate :winner_must_participate

  private

  def not_fighting_self
    errors.add(:away, I18n.t('fight.errors.not_fighting_self')) if home == away
  end

  def winner_must_participate
    errors.add(:away, I18n.t('fight.errors.winner_must_participate')) if winner.present? and ![home,away].include?(winner)
  end

  def resolve
    home.current_hp = home.max_hp
    away.current_hp = away.max_hp

    puts home.current_hp
    puts away.current_hp

    while !home.dead? and !away.dead?
      home_hit_chance = home.hit_chance
      away_hit_chance = away.hit_chance

      if home_hit_chance == away_hit_chance
        self.turns.build action: 'miss'
      elsif home_hit_chance > away_hit_chance
        dmg = home.damage
        away.current_hp -= dmg
        self.turns.build action: 'hit', offense: home, defense: away, damage: dmg
      else
        dmg = away.damage
        home.current_hp -= dmg
        self.turns.build action: 'hit', offense: away, defense: home, damage: dmg
      end
    end

    self.winner = home.dead? ? away : home
  end

end