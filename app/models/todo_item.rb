class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :desc, presence: true
  validates :todo_list, presence: true
end
