class Person < ActiveRecord::Base
has_many :encounters
belongs_to :user
has_many :users,:through => :encounters
validates :gender, :length => { :maximum => 50}
validates :birthdate_estimated,:presence => true,
                              :length => { :maximum => 6}
validates :dead, :presence => true,
               :length => { :maximum => 6}
validates :cause_of_death, :length => { :maximum => 11}
validates :creator, :presence => true,
                    :length => { :maximum => 11}
validates :date_created, :presence => true
validates :changed_by, :length => { :maximum => 11}
validates :voided, :presence => true,
                   :length => { :maximum => 6}
validates :voided_by, :length => { :maximum => 11}
validates :void_reason, :length => { :maximum => 255}
validates :uuid, :presence => true,
                 :length => { :maximum => 38}
end
