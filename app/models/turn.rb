class Turn < ApplicationRecord

  belongs_to :fight

  belongs_to :offense, class_name: "Gladiator", required: false
  belongs_to :defense, class_name: "Gladiator", required: false

end