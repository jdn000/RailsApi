class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:last_name,:username, :description,:role,:created_at
end