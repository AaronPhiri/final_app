class User < ActiveRecord::Base

has_secure_password

has_many :encounters
has_many :locations
belongs_to :person
belongs_to :system
has_many :people,:through => :encounters
has_many :locations,:through => :encounters
has_and_belongs_to_many :roles


scope :retired,lambda{where(:retired => 1)}
scope :notretired,lambda{where(:retired => 0)}
scope :online,lambda{where "updated_at >?",10.minutes.ago}


validates :retired, :presence => true,
                    :length => { :maximum => 4}
validates :uuid, :presence => true,
                 :length => { :maximum => 38}
 validates :system_id, :presence => true,
                       :length => { :maximum => 50}
validates :creator,:presence => true,
                   :length => { :maximum => 11}
validates :changed_by, :length => { :maximum => 11}
validates :username, :length => { :maximum => 50}
validates :password, :presence => true,
           :length => { :maximum => 128}
validates :password_confirmation,:presence => true
validates_confirmation_of :password
validates :secret_question, :length => { :maximum => 255}
validates :secret_answer, :length => { :maximum => 255}
validates :date_created, :presence => true
validates :retired_by, :length => { :maximum => 11}
validates :retire_reason, :length => { :maximum => 255}
validates :person_id, :length => { :maximum => 11}

end
