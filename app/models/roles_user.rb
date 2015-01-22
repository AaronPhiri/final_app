class RolesUser < ActiveRecord::Base
belongs_to :user
	belongs_to :role

validates :user_id, :presense => true,
                    :length => { :maximum => 11}
validates :role,:presense => true,
                    :length => { :maximum => 50}
end
