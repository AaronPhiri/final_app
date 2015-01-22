class Order < ActiveRecord::Base
validates :order_type_id,:presence => true,
                          :length => { :maximum => 11}
validates :concept_id,:presence => true,
                          :length => { :maximum => 11}
validates :orderer, :length => { :maximum => 11}
validates :encounter_id, :length => { :maximum => 11}
validates :discontinued,:presence => true,
                         :length => { :maximum => 6}
validates :discontinued_by, :length => { :maximum => 11}
validates :discontinued_reason, :length => { :maximum => 11}
validates :creator,:presence => true,
                   :length => { :maximum => 11}
validates :date_created, :presence => true
validates :voided, :presence => true,
                   :length => { :maximum => 6}
validates :voided_by, :length => { :maximum => 11}
validates :void_reason, :length => { :maximum => 255}
validates :patient_id, :presence => true,
                       :length => { :maximum => 11}
validates :accession_number, :length => { :maximum => 255}
validates :uuid, :presence => true,
               :length => { :maximum => 38}

end
