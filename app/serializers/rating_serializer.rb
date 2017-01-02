class RatingSerializer < ActiveModel::Serializer
  attributes :id, :review, :art, :plot, :character, :likes, :reccomendations, :user, :anime
end
