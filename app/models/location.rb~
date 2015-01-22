class Location < ActiveRecord::Base
belongs_to :user
has_many :encounters
has_many :users,:through => :encounters
validates :name, :presence => true,
                 :length => { :maximum => 255}
validates :description, :length => { :maximum => 255}
validates :address1, :length => { :maximum => 50}
validates :address2, :length => { :maximum => 50}
validates :city_village, :length => { :maximum => 50}
validates :state_province, :length => { :maximum => 50}
validates :postal_code, :length => { :maximum => 50}
validates :country, :length => { :maximum => 50}
validates :latitude, :length => { :maximum => 50}
validates :longitude, :length => { :maximum => 50}
validates :creator, :presence => true,
                    :length => { :maximum => 11}
validates :date_created, :presence => true
validates :country_district, :length => { :maximum => 50}
validates :neighborhood_cell, :length => { :maximum => 50}
validates :region, :length => { :maximum => 50}
validates :subregion, :length => { :maximum => 50}
validates :township_division, :length => { :maximum => 50}
validates :retired, :presence => true,
                    :length => {:default => 0, :maximum => 255}
validates :retired_by, :length => { :maximum => 11}
validates :retire_reason, :length => { :maximum => 255}
validates :parent_location, :length => { :maximum => 11}
validates :uuid, :presence => true,
                 :length => { :maximum => 38}

end
