require 'spec_helper'
require 'rails_helper'

describe Api::TodoItemsController do
  context "for a logged-in user with 2 tasks" do
    let(:todo_list) { create(:todo_list, :with_todo_items) }
    let(:todo1) { todo_list.todo_items[0] }
    let(:todo2) { todo_list.todo_items[1] }
    let(:user) { todo_list.user }

    before { sign_in(user) }

    describe "#index" do
      it "should return json of those tasks" do
        get :index, todo_list_id: todo_list.id
        todo_item = JSON.parse(response.body)
        todo_item.should == [
          {'id' => todo1.id, 'desc' => todo1.desc,
            'priority' => nil, 'due_date' => nil, 'completed' => false},
          {'id' => todo2.id, 'desc' => todo2.desc,
            'priority' => nil, 'due_date' => nil, 'completed' => false}
        ]
      end
    end

    describe "#create" do
      let(:post_create) do
        post :create, todo_list_id: todo_list.id, desc: "New todo"
      end

      it "should add the record to the database" do
        expect {
          post_create
        }.to change(TodoItem, :count).by(1)
      end

      it "should return 200 OK" do
        post_create
        response.should be_success
      end

      it "should preserve passed parameters" do
        post_create
        TodoItem.order(:id).last.desc.should == "New todo"
      end
    end


    describe "#update" do
      let(:patch_update) do
        patch :update, todo_list_id: todo_list, id: todo1.id,
          desc: "New description", priority: 1, completed: true
      end

      it "should update parameters of given todo" do
        patch_update
        todo1.reload.desc.should == "New description"
        todo1.priority.should == 1
        todo1.completed.should == true
      end

      it "should return 200 OK" do
        patch_update
        response.should be_success
      end
    end

  end
end