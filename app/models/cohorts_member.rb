class CohortsMember < ActiveRecord::Base
belongs_to :cohort
belongs_to :patient
validates :cohort_id,:presence => true,
                       :length => { :maximum => 11}
validates :patient_id,:presence => true,
                       :length => { :maximum => 11}
end
