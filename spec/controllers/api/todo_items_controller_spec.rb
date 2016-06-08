require 'spec_helper'
require 'rails_helper'

describe Api::TodoItemsController do 
  describe "#index" do 
    context "for user that has a todo list with some todos" do 
      let(:todo_list) { create(:todo_list, :with_todo_items) }
      let(:todo1) { todo_list.todo_item[0] }
      let(:todo2) { todo_list.todo_item[1] }
      let(:user) { todo_list.owner }

      before do 
        sign_in(user)
      end

      it "should return json of those tasks" do 
        get :index, todo_list_id: todo_list.id
        todo_item = JSON.parse(response.body)
        todo_item.should == [
          {'id' => todo1.id, 'desc' => todo1.desc, 'priority' => nil, 'due_date' => nil, 'completed' => false},
          {'id' => todo2.id, 'desc' => todo2.desc, 'priority' => nil, 'due_date' => nil, 'completed' => false}
        ]
      end
    end
  end
end
