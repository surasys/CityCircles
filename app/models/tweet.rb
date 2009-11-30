# == Schema Information
# Schema version: 20091128210317
#
# Table name: tweets
#
#  id                :integer(4)      not null, primary key
#  post_id           :integer(4)      not null
#  tweet_id          :integer(4)      not null
#  body              :string(255)     not null
#  from_user         :string(255)     not null
#  to_user           :string(255)
#  iso_language_code :string(255)
#  source            :string(255)
#  profile_image_url :string(255)
#  tweeted_at        :string(255)     not null
#  location          :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Tweet < ActiveRecord::Base
  belongs_to :post
end
