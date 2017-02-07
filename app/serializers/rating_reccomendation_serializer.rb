class RatingReccomendationSerializer < ActiveModel::Serializer
  attributes :id, :user, :receiver, :rating
end
