class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to todo_list_path(id: current_user.todo_list)
    end
  end
end
