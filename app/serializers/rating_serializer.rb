class RatingSerializer < ActiveModel::Serializer
  attributes :id, :user, :anime, :plot, :art, :character, :overall, :review, :likes
end
