class FeedController < ApplicationController
  def home
    @topic_tags = Question.tag_counts_on(:topics).first(10)
    @condition_tags = Question.tag_counts_on(:conditions).first(10)


    @tags = session[:feed_filter_tags] || []

    if params[:clear]
      @tags = []
    else
      new_tag = params[:topic_id] || params[:condition_id]
      @tags.push new_tag if ! @tags.include?(new_tag)
    end

    session[:feed_filter_tags] = @tags

    if @tags.count > 0
      @questions = Question.tagged_with(@tags).paginate(:page => params[:page])
    else
      @questions = Question.paginate(:page => params[:page])
    end

  end
end
