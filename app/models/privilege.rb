class Privilege < ActiveRecord::Base
 has_and_belongs_to_many :roles
validates :privilege, :presence => true,
                   :length => { :maximum => 50}
validates :description, :presence => true,
                   :length => { :maximum => 250}
validates :uuid, :presence => true,
                   :length => { :maximum => 38}
end
