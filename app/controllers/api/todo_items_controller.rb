class Api::TodoItemsController < ApplicationController
  def index
    render json: todo_list.todo_items
  end

  def create
    todo_list.todo_items.create!(safe_params)
    render nothing: true
  end

  def update
    todo_list.todo_items = todo_list.todo_items.update(safe_params)
    render nothing: true
  end

  private

  def todo_list
    TodoList.find_by_id(params[:todo_list_id])
  end

  def todo_item
    TodoList.todo_items.find_by_id(params[:id])
  end

  def safe_params
    params.permit(:desc, :priority, :completed)
  end
end