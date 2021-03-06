class Cohort < ActiveRecord::Base
belongs_to :user
has_many :cohorts_members

validates :name, :presence => true,
                 :length => { :maximum => 255}
validates :description, :length => { :maximum => 1000}
validates :creator, :presence => true,
                 :length => { :maximum => 11}
validates :date_created, :presence => true
validates :voided, :presence => true,
                 :length => { :maximum => 6}
validates :voided_by, :length => { :maximum => 11}
validates :void_reason, :length => { :maximum => 255}
validates :changed_by,  :length => { :maximum => 11}
validates :uuid, :presence => true,
                 :length => { :maximum => 38}
                
end
