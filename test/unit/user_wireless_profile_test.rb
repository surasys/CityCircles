# == Schema Information
#
# Table name: user_wireless_profiles
#
#  id                  :integer(4)      not null, primary key
#  user_id             :integer(4)      not null
#  wireless_carrier_id :string(255)
#  wireless_number     :string(255)
#  subscriptions       :string(255)
#  digest              :boolean(1)      default(TRUE)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class UserWirelessProfileTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
