class Fight < ApplicationRecord
  belongs_to :home, class_name: "Gladiator"
  belongs_to :away, class_name: "Gladiator"
  belongs_to :winner, class_name: "Gladiator", required: false

  validate :not_fighting_self
  validate :winner_must_participate

  private

  def not_fighting_self
    errors.add(:away, I18n.t('fight.errors.not_fighting_self')) if home == away
  end

  def winner_must_participate
    errors.add(:away, I18n.t('fight.errors.winner_must_participate')) if winner.present? and ![home,away].include?(winner)
  end
end