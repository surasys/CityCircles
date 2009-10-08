# == Schema Information
# Schema version: 20091005071144
#
# Table name: events
#
#  id                :integer(4)      not null, primary key
#  interest_point_id :integer(4)      not null
#  map_icon_id       :integer(4)      not null
#  lat               :decimal(10, 6)
#  lng               :decimal(10, 6)
#  headline          :string(255)     not null
#  body              :string(255)     not null
#  starts_at         :datetime        not null
#  ends_at           :datetime        not null
#  author_id         :integer(4)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Event < ActiveRecord::Base
  has_many :comments, :as => :commenter
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
end
