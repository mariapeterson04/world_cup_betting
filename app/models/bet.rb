class Bet < ApplicationRecord
  # Direct associations

  belongs_to :matches_group

  belongs_to :user

  # Indirect associations

  # Validations

end
