class Role < ActiveRecord::Base
	has_and_belongs_to_many :privileges
has_and_belongs_to_many :users
 validates :role, :presence => true,
                   :length => { :maximum => 50}
validates :descriptio, :presence => true,
                       :length => { :maximum => 255}
validates :uuid, :presence => true,
                 :length => { :maximum => 38}

end
