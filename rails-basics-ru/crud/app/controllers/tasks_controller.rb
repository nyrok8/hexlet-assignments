# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Задача успешно создана'
      redirect_to @task
    else
      flash[:notice] = 'Упс, поправьте ошибки в форме'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: 'Задача успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Задача успешно удалена'
      redirect_to tasks_path
    else
      flash[:notice] = 'Упс, не получилось удалить задачу'
      redirect_back fallback_location: :task_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
