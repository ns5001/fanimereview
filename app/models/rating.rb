class Rating < ApplicationRecord
  belongs_to :anime
  belongs_to :user

  def self.highest
    self.all.sort { |a,b| b.likes <=> a.likes }
  end

  def self.top_three(id)
    self.all.where(anime_id: id).sort { |a,b| b.likes <=> a.likes }
  end

  def self.order_for()
    
  end

end
