var app = angular.module('todoApp').factory('Todo', function($resource) {
  var Todo_item;
  return Todo_item = (function() {
    function Todo_item(TodoListId) {
      this.service = $resource('/api/todo_lists/:todo_list_id/todo_items', {
        todo_list_id: TodoListId
      });
    }

    Todo.prototype.create = function(attrs) {
      var todo_item;
      todo_item = new this.service(attrs);
      return todo_item.$save();
    };

    Todo.prototype.all = function() {
      return this.service.query();
    };

    return Todo_item;
  })();
});