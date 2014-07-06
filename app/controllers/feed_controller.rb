class FeedController < ApplicationController
  def home
    @condition_tags = Question.tag_counts_on(:conditions)
    @topic_tags = Question.tag_counts_on(:topics)

    tags = []
    tags.push params[:condition_id] if params[:condition_id]
    tags.push params[:topic_id] if params[:topic_id]

    if tags.count > 0
      @questions = Question.tagged_with(tags).paginate(:page => params[:page])
    else
       @questions = Question.paginate(:page => params[:page])
    end

  end
end
