class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :city

  composed_of :address, :mapping => [ %w(address_street street),
                                      %w(address_postal_code postal_code),
                                      %w(city_id city_id) ]

  attr_accessible :name, :description, :address_street, :address_postal_code
end

class Address
  attr_reader :street, :postal_code, :city

  def initialize(street, postal_code, city_id)
    @street, @postal_code = street, postal_code
    @city = City.find(city_id)
  end

  def country
    'Poland'
  end

  def pprint
    "#{@street}\n#{@postal_code} #{@city}"
  end
end
