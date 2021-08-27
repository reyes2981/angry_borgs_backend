class PlayerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :username, :email

end