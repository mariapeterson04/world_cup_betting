class MatchesKnockout < ApplicationRecord
  # Direct associations

  has_one    :result,
             :foreign_key => "bet_id",
             :dependent => :destroy

  has_many   :bets_knockouts,
             :foreign_key => "match_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :bets_knockouts,
             :source => :user

  # Validations

end
