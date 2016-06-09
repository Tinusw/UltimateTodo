class Api::TodoItemsController < ApplicationController
  def index
    render json: todo_list.todo_items
  end

  def create
    todo_list.todo_items.create!(params.permit(:desc))
    render nothing: true
  end

  private
  def todo_list
    TodoList.find_by_id(params[:todo_list_id])
  end
end