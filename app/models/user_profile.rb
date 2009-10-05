# == Schema Information
# Schema version: 20091005071144
#
# Table name: user_profiles
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  first_name :string(255)
#  last_name  :string(255)
#  about_me   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserProfile < ActiveRecord::Base

  belongs_to :user

end
