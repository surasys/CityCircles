# == Schema Information
# Schema version: 20091112051900
#
# Table name: interests
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Interest < ActiveRecord::Base    
end