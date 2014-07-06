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
  has_many :answers

  acts_as_taggable_on :conditions, :topics

  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
      
  
end
