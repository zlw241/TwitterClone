# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ActiveRecord::Base
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true

  after_initialize :ensure_session_token

  has_many :followings,
    class_name: "Follower",
    foreign_key: :user_id

  has_many :followers,
    through: :followings,
    source: :follower

  has_many :follows,
    class_name: "Follower",
    foreign_key: :follower_id

  has_many :users_followed,
    through: :follows,
    source: :user

  has_many :tweets,
    class_name: "Tweet",
    foreign_key: :user_id

  has_many :retweets,
    class_name: "Retweet",
    foreign_key: :user_id

  def timeline
    all_tweets = self.users_followed.includes(:tweets)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.valid_password?(password)
    nil
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
