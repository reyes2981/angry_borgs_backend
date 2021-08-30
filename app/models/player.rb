class Player < ApplicationRecord
    #validates_presence_of :email
    #validates_uniqueness_of :email
    has_many :scores
end
