class Tribe < ActiveRecord::Base
has_many :patients,:foreign_key =>"tribe"
validates :retired, :presence => true,
                    :length => { :maximum => 1}
validates :name, :presence => true,
                 :length => { :maximum => 50}
end
