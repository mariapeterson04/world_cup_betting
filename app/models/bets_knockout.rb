class BetsKnockout < ApplicationRecord
  # Direct associations

  belongs_to :user_signed,
             :class_name => "MatchesKnockout",
             :foreign_key => "match_id"

  belongs_to :user

  # Indirect associations

  # Validations

end
