# == Schema Information
#
# Table name: conditions
#
#  id         :integer          not null, primary key
#  elder_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Condition < ActiveRecord::Base
  belongs_to :elder
  validates :elder_id,  presence: true
  validates :name,  presence: true
end
