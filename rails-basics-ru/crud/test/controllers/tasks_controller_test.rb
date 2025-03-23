# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }
  end

  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get new' do
    get new_task_path
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count', 1) do
      post tasks_path, params: { task: @attrs }
    end
    assert_response :redirect
  end

  test 'should show task' do
    task = Task.create!(@attrs)
    get task_path(task)
    assert_response :success
  end

  test 'should get edit' do
    task = Task.create!(@attrs)
    get edit_task_path(task)
    assert_response :success
  end

  test 'should update task' do
    task = Task.create!(@attrs)
    patch task_path(task), params: { task: { name: 'Updated Task Name' } }
    assert_response :redirect
    assert_equal 'Updated Task Name', task.reload.name
  end

  test 'should destroy task' do
    task = Task.create!(@attrs)
    assert_difference('Task.count', -1) do
      delete task_path(task)
    end
    assert_response :redirect
  end
end
