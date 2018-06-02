class Result < ApplicationRecord
  # Direct associations

  belongs_to :groupmatchresult,
             :class_name => "MatchesGroup",
             :foreign_key => "bet_id"

  belongs_to :bet,
             :class_name => "BetsGroup"

  # Indirect associations

  # Validations

end
