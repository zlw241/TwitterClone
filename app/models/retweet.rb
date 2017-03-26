# == Schema Information
#
# Table name: retweets
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  tweet_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Retweet < ActiveRecord::Base

  validates :user_id, :tweet_id, presence: true

  belongs_to :user
  belongs_to :tweet

end
