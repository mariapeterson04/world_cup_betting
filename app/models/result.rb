class Result < ApplicationRecord
  # Direct associations

  belongs_to :bet,
             :class_name => "BetsGroup"

  # Indirect associations

  # Validations

end
