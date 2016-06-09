require 'spec_helper'
require 'rails_helper'

describe Api::TodoItemsController do 
  context "for a new logged-in user" do
    let(:user) { create(:user) }
    before { sign_in(user) }


    describe "#index" do 
      context "for a todo list with some todos" do 
        let(:todo_list) { create(:todo_list, :with_todo_items, user: user) }
        let(:todo1) { todo_list.todo_items[0] }
        let(:todo2) { todo_list.todo_items[1] }

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

    describe "#create" do 
      let(:post_create) do 
        post :create, todo_list_id: user.todo_list.id, desc: "new todo item"
      end

      it "should add the record to the db" do 
        expect {
          post_create
        }.to change(TodoItem, :count).by(1)
      end

      it "should return 200 OK" do 
        post_create
        response.should be_success
      end
    end
  end
end
