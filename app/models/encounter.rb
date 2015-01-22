class Encounter < ActiveRecord::Base
belongs_to :user
belongs_to :location
validates :encounter_type,:presence => true,
                          :length => { :maximum => 11}
validates :patient_id,:presence => true,
                          :length => { :maximum => 11}
validates :provider_id,:presence => true,
                          :length => { :maximum => 11}
validates :location, :length => { :maximum => 255}
validates :form_id, :length => { :maximum => 11}
validates :encounter_datetime,:presence => true
validates :creator,:presence => true,
                          :length => { :maximum => 11}
validates :date_created,:presence => true
validates :voided,:presence => true,
                          :length => { :maximum => 6}
validates :voided_by, :length => { :maximum => 11}
validates :void_reason, :length => { :maximum => 255}
validates :uuid,:presence => true,
                          :length => { :maximum => 38}
validates :changed_by, :length => { :maximum => 11}



                        


                          





end
