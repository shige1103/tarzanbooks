class PhotosController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    if logged_in?
      @photo = current_user.photos.build  # form_with 用
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '写真をアップロードしました。'
      redirect_to @user
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '写真のアップロードに失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :photo)
  end
end
