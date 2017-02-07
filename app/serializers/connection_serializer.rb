class ConnectionSerializer < ActiveModel::Serializer
  attributes :id, :user, :receiver
end
