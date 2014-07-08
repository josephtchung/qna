class FeedController < ApplicationController
  def home
    @topic_tags = Question.tag_counts_on(:topics).first(10)
    @condition_tags = Question.tag_counts_on(:conditions).first(10)


    @filter_tags = session[:feed_filter_tags] || []

    if params[:clear]
      @filter_tags = []
    else
      new_tag = params[:topic_id] || params[:condition_id]
        @filter_tags.push new_tag if new_tag && ! @filter_tags.include?(new_tag)
    end

    session[:feed_filter_tags] = @filter_tags

    if @filter_tags.count > 0
      @questions = Question.tagged_with(@filter_tags).paginate(:page => params[:page])
    else
      @questions = Question.paginate(:page => params[:page])
    end

  end
end
