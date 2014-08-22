class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks

  # establish user.relationships, change the foreign key of relationships table from user_id to follower_id
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  # set up access to followed_users, has many = inner join on , source change default of followed_user_id to followed_id
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships

  def following?(other_user)
  	relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
  	relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
  	relationships.find_by(followed_id: other_user.id).destroy
  end
end
