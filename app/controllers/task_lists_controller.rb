class TaskListsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @task_list = current_user.task_lists.build(task_list_params)
    
    if @task_list.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
      
    else
      @task_lists = current_user.task_lists.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/#index'
    end   
  end

  def destroy
    @task_list.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
    
  end
  
  private
    def task_list_params
      params.require(:task_list).permit(:content)
    end 
    
    def correct_user
      @task_list = current_user.task_lists.find_by(id: params[:id])
      unless @task_list
      redirect_to root_url
      end 
    end 
end
