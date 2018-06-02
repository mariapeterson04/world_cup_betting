class MatchesKnockout < ApplicationRecord
  # Direct associations

  has_many   :bets_knockouts,
             :foreign_key => "match_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
