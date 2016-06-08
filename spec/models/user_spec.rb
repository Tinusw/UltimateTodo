require 'rails_helper'

describe User do 
  context "for new valid user" do 
    let(:user) { create(:user) }

    it "Should have an associated todo list" do
      user.todo_list.should be_a(TodoList)
    end
  end
end
