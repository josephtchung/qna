# == Schema Information
#
# Table name: elders
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(255)
#  age          :integer
#  sex          :string(255)
#  relationship :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Elder do
  pending "add some examples to (or delete) #{__FILE__}"
end
