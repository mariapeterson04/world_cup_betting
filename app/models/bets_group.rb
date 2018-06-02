class BetsGroup < ApplicationRecord
  # Direct associations

  belongs_to :match,
             :class_name => "MatchesGroup"

  has_one    :result,
             :foreign_key => "bet_id",
             :dependent => :nullify

  belongs_to :user

  # Indirect associations

  # Validations

end
