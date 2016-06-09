class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.find_by_id(params[:id])
  end
end 