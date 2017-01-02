class Rating < ApplicationRecord
  belongs_to :anime
  belongs_to :user

  def self.highest
    self.all.sort { |a,b| b.likes <=> a.likes }
  end

end
