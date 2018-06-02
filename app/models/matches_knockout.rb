require 'open-uri'
class MatchesKnockout < ApplicationRecord
  before_validation :geocode_city

  def geocode_city
    if self.city.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.city)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.city_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.city_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.city_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
