class Player < ApplicationRecord
    has_secure_password
    has_many :scores

   #validates_presence_of :email
   #validates_uniqueness_of :email

end
