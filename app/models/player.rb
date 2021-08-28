class Player < ApplicationRecord
    has_secure_password # helper method
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_presence_of :password, length: { minimum: 6 }
    has_many :scores
end
