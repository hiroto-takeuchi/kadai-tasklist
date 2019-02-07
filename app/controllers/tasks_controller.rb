class TasksController < ApplicationController
    def index 
        @tasks = Task.all
    end 
    
    def show 
        @task = Task.find(params[:id])
    end 
    
    def create 
    end 
    
    def new 
        @task = Tsak.new
    end 
    
    def update 
    end 
    
    def edit 
        @task = task.find(params[:id])
    end 
    
    def destroy
    end 
end
