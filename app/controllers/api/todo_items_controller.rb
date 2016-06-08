class Api::TodoItemsController < ApplicationController
  def index
    render json: todo_list.todo_items
  end

  private
  def todo_list
    TodoList.find_by_id(params[:todo_list_id])
  end
end