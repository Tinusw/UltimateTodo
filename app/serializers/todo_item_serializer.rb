class TodoItemSerializer < ActiveModel::Serializer
  attributes :id, :desc, :priority, :due_date, :completed
end
