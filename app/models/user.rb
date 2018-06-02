class User < ApplicationRecord
  # Direct associations

  has_many   :bets_knockouts,
             :dependent => :destroy

  has_many   :bets_groups,
             :dependent => :destroy

  # Indirect associations

  has_many   :user_signeds,
             :through => :bets_knockouts,
             :source => :user_signed

  has_many   :matches,
             :through => :bets_groups,
             :source => :match

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
