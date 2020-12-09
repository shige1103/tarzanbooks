class SkillsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @skills = current_user.skills.build(skill_params)
    if @skill.save
      flash[:success] = "スキルを登録しました。"
      redirect_to root_url
    else
      @skills = current_user.feed_skills.order(id: :desc).page(params[:page])
      flash.now[:danger] = "スキルの登録に失敗しました。"
      render "users/edit"
    end
  end

  def edit
  end

  def destroy
    @skill.destroy
    flash[:success] = "スキルを削除しました。"
    redirect_back(fallback_location: root_path)
  end
end
