class ToppagesController < ApplicationController
  def index
    if logged_in?
      @task_list = current_user.task_lists.build
      @task_lists = current_user.task_lists.order('created_at DESC').page(params[:page])
    end 
  end
end
