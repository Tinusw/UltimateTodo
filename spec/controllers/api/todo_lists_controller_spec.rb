require 'spec_helper'
require 'rails_helper'

describe Api::TodoListsController do 
  describe "#index" do
    context "for user that has a task list" do 
      let(:user) { create(:user) }
      before { sign_in(user) }

      it "should return json of array of those task lists" do 
        get :index 
        todo_items = JSON.parse(response.body)
        todo_items.should == [{'id' => user.todo_list.id}]
      end
    end
  end
end