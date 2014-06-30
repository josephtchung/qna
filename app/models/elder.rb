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

class Elder < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable_on :conditions

  validates :user_id,  presence: true
  validates :name,  presence: true

end
