require 'rails_helper'

describe TodoList do 
  it "should raise validation error when owner isn't provided" do 
    expect {
      create(:todo_list, user:nil)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  context "for new valid task list" do 
    let(:todo_list) { create(:todo_list) }

    it "should have an empty list of tasks" do
      todo_list.todo_items.should == []
    end
  end
end
