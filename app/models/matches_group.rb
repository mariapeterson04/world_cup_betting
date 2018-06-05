class MatchesGroup < ApplicationRecord
  # Direct associations

  has_many   :bets,
             :dependent => :destroy

  has_one    :result,
             :foreign_key => "bet_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :team_one, :presence => true

  validates :team_two, :presence => true

end
