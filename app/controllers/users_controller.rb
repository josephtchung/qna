class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :new_elder]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.paginate(:page => params[:qpage], :per_page => 10)
    @answers = @user.answers.paginate(:page => params[:apage], :per_page => 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Qna!"
      redirect_back_or @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def index
    @users = User.paginate(page: params[:page])
  end

# Elder Actions
  def edit_elder
    @elder = current_user.get_or_build_elder
  end

  def create_elder
    @elder = current_user.get_or_build_elder
    @elder.update_attributes(elder_params)
    if @elder.save
      flash[:success] = "Elder Info Saved!"
      redirect_to current_user
    else
      render 'edit_elder'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def elder_params
    params.require(:elder).permit(:name, :age, :sex, :relationship, :condition_list)
  end

  # Before filters

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
