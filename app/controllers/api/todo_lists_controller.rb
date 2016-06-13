class Api::TodoListsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    render json: [current_user.todo_list]
  end
end