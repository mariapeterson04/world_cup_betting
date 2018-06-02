class MatchesGroup < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :team_one, :presence => true

  validates :team_two, :presence => true

end
