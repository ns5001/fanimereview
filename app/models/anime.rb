class Anime < ApplicationRecord
  has_many :ratings

  def self.reccomended
    self.all.sort { |a,b| b.reccomendations <=> a.reccomendations }
  end
end
