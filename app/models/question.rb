# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable_on :conditions, :topics

  validates :content, presence: true
      
  
end
