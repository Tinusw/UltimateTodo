angular.module('todoApp').factory('Todo_item', function($resource) {
  var Todo_item;
  return Todo_item = (function(){
    function Todo_item(todoListId) {
      this.services = $resource('/api/todo_lists:todo_list_id/todo_items', {
        todo_list_id: todoListId
      });
    }

    Todo_item.prototype.create = function(attrs) {
      var todo_item;
      todo_item = new this.service(attrs);
      return todo_item.$save();
    };

    Todo_item.prototype.all = function() {
      return this.service.query();
    };

    return Todo_item;
  })();
});