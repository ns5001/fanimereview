class AnimeReccomendationSerializer < ActiveModel::Serializer
  attributes :id, :user, :receiver, :anime
end
