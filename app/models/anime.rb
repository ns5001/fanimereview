class Anime < ApplicationRecord
  has_many :ratings
  has_many :anime_reccomendations

  def self.reccomended
    self.all.sort { |a,b| b.reccomendations <=> a.reccomendations }
  end

  def self.searchFor(search_term)
    Anime.where(name:search_term)
  end

  def topThree
    ary = []
    if Rating.where(anime:self).size > 0
      sorted = Rating.where(anime:self).sort
      if sorted.size < 3
        for i in (0..sorted.length-1)
          ary << sorted[i]
        end
      else
        for i in (0..2)
          ary << sorted[i]
        end
      end
    end
    ary
  end


end
