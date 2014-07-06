class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]

  def show
    @user = current_user
    @question = Question.find(params[:id])
    @answers = @question.answers.paginate(:page => params[:page])
    @answer = @question.answers.build(user_id: @user.id)
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

  def create_answer
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Answer Saved!"
    end
    redirect_to @answer.question
  end

  private

  def question_params
    params.require(:question).permit(:content, :topic_list, :condition_list)
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end

end
