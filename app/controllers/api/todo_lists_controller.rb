class Api::TodoListsController < ApplicationController
  def index
    render json: [current_user.todo_list]
  end
end