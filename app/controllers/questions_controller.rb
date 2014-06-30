class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]

  def show
    @user = current_user
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.build if signed_in?
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question Saved!"
      redirect_to @question
    else
      render 'new'
    end
  end


  private

  def question_params
    params.require(:question).permit(:content, :topic_list, :condition_list)
  end

end
