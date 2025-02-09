class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :phone, :first_name, :last_name
end
