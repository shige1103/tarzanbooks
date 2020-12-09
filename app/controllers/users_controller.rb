class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:edit]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(50)
  end

  def show
    @user = User.find(params[:id])
    @skill = @user.skills.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールを変更しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールが変更できませんでした。'
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profession, :first_name, :last_name, :profile,)
  end
  
  def correct_user
  end
end
