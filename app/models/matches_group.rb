class MatchesGroup < ApplicationRecord
  # Direct associations

  has_many   :bets_groups,
             :foreign_key => "match_id",
             :dependent => :destroy

  has_one    :result,
             :foreign_key => "bet_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :bets_groups,
             :source => :user

  # Validations

  validates :team_one, :presence => true

  validates :team_two, :presence => true

end
