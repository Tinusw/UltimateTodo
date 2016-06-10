angular.module('todoApp').factory('Todo_item', function($resource) {
  var Todo_item;
  return Todo_item = (function() {
    console.log("todo_item service running")
    function Todo_item(todoListId) {
      this.services = $resource('/api/todo_lists:todo_list_id/todo_items/:id', {
        todo_list_id: todoListId,
        id: '@id'
      }
      });
    }

    Todo_item.prototype.create = function(attrs) {
      return new this.service().$save(attrs);
    };

    Todo_item.prototype.all = function() {
      return this.service.query();
    };

    return Todo_item;
  })();
});