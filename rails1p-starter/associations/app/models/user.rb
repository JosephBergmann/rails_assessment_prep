# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :videos,
    primary_key: :id,
    foreign_key: :uploader_id,
    class_name: :Video,
    dependent: :destroy

    has_many :comments,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: :Comment,
    dependent: :destroy

    has_many :likes,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :Like,
    dependent: :destroy

    has_many :liked_videos,
    through: :likes,
    source: :video

    has_many :videos_commented,
    primary_key: :id,
    through: :likes,
    source: :video

    has_many :likers,
    through: :videos,
    source: :likers
end