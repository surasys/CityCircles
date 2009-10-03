# == Schema Information
# Schema version: 20091003085734
#
# Table name: interest_points
#
#  id           :integer(4)      not null, primary key
#  map_id       :integer(4)      not null
#  map_layer_id :integer(4)      not null
#  label        :string(255)     not null
#  description  :string(255)
#  lat          :decimal(10, 6)
#  lng          :decimal(10, 6)
#  author_id    :integer(4)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

class InterestPoint < ActiveRecord::Base
  belongs_to :map
  belongs_to :map_layer
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :photos, :as => :photoable
  has_many :comments, :as => :commentable
end