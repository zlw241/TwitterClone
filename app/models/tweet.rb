# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  reply_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base

  validates :user_id, :body, presence: true
  validates :body, length: { maximum: 140 }

  belongs_to :user

  belongs_to :reply,
    class_name: "Tweet",
    foreign_key: :reply_id

  has_many :replies,
    class_name: "Tweet",
    foreign_key: :reply_id

  has_many :retweets,
    class_name: "Retweet",
    foreign_key: :tweet_id



end
