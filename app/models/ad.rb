# == Schema Information
# Schema version: 20100524015823
#
# Table name: ads
#
#  id                   :integer(4)      not null, primary key
#  organization_id      :integer(4)      not null
#  placement            :string(255)     not null
#  starts_at            :datetime        not null
#  ends_at              :datetime        not null
#  weight               :integer(4)      default(1)
#  graphic_file_name    :string(255)     not null
#  graphic_content_type :string(255)
#  graphic_file_size    :integer(4)
#  graphic_updated_at   :datetime
#  is_approved          :boolean(1)
#  created_at           :datetime
#  updated_at           :datetime
#  interest_point_id    :integer(4)
#  link_uri             :string(255)
#  popup_html           :text
#

class Ad < ActiveRecord::Base
 
  # Relationships
  belongs_to :organization
  belongs_to :interest_point

  # Paperclip
  has_attached_file :graphic, :styles => { :map => "100x100>", :large => "220x240>", :huge => "300x300>", :homepage_under_map => "940x100>" }, :path => ":rails_root/public/system/assets/ads/graphics/:id/:style_:basename.:extension", :url => "/system/assets/ads/graphics/:id/:style_:basename.:extension", :default_url => "/images/ad.jpg"

  validates_attachment_presence :graphic, :message => "must be an image."  
  validates_presence_of :placement
  validates_presence_of :organization_id
  validates_presence_of :starts_at, :message => "must have a start date and time."
  validates_presence_of :ends_at, :message => "must have an end date and time."
  
  def label
    "<a href='#'>#{ placement } Ad</a>"
  end
  
  def self.placement
    [ { :placement => 'Homepage Map', :size => 'height : 100px, width : 100px' }, { :placement => 'Homepage Under Map', :size => 'height : 100px, width : 940px' }, { :placement => 'Profile Map', :size => 'height : 100px, width : 100px' } ]
  end
  
end
