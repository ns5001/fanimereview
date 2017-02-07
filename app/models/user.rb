class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username

has_many :ratings
has_many :connections
has_many :requests, class_name: 'Connection', foreign_key: :reciever_id
has_many :messages
has_many :received_messages, class_name: 'Message', foreign_key: :receiver_id
has_many :anime_reccomendations
has_many :rating_reccomendations
has_many :received_anime_reccomendations, class_name: 'AnimeReccomendation', foreign_key: :reciever_id
has_many :received_rating_reccomendations, class_name: 'RatingReccomendation', foreign_key: :reciever_id


  def sent_messages
    self.messages.where(reply: false)
  end

  def received_messages
    Message.where(receiver_id:self.id, reply:false)
  end

  def received_requests
    Connection.where(receiver_id:self.id, status:false)
  end

  def sent_requests
    Connection.where(user_id:self.id, status:false)
  end

  def friends
    Connection.where(user:self, status:true).or(Connection.where(receiver:self, status:true))
  end

  def reviews
    Rating.where(user:self)
  end

  def reccomendedAnime
    AnimeReccomendation.where(user_id:self.id)
  end

  def reccomendedRating
    RatingReccomendation.where(user_id:self.id)
  end

  def friends_order
    ary = []
    self.friends.each do |friend|
      ary << friend.receiver
    end
    ary.sort
  end


end
