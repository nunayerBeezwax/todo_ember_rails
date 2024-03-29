class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: 201
    else
      render json: @task.errors, status: 422
    end
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: 422
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

private
  def task_params
    params.fetch(:task).permit(:name, :completed)
  end
end
