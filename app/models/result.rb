class Result < ApplicationRecord
  # Direct associations

  belongs_to :groupmatchresult,
             :class_name => "MatchesGroup",
             :foreign_key => "bet_id"

  # Indirect associations

  # Validations

end
