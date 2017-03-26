# == Schema Information
#
# Table name: followers
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  follower_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Follower < ActiveRecord::Base

  validates :user_id, :follower_id, presence: true
  
  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,

  belongs_to :follower,
    class_name: "User",
    foreign_key: :follower_id


end
