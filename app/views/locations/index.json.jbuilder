json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description, :address1, :address2, :city_village, :state_province, :postal_code, :country, :latitude, :longitude, :creator, :date_created, :country_district, :neighborhood_cell, :region, :subregion, :township_division, :retired, :retired_by, :date_retired, :retire_reason, :parent_location, :uuid
  json.url location_url(location, format: :json)
end
