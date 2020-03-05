class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:last_name,:username, :description,:role,:activated,:created_at
end