class RolesPrivilege < ActiveRecord::Base
belongs_to :role
belongs_to :privilege
validates :role, :presence => true,
                   :length => { :maximum => 50}
validates :privilege, :presence => true,
                   :length => { :maximum => 50}

end
