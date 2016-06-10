angular.module('todoApp').controller("TodoListController", function($scope, Todo_item) {
  $scope.init = function(todoListId) {
    this.todo_itemService = new Todo_item(todoListId);
    return $scope.todo_items = this.todo_itemService.all();
  };
  return $scope.addTodo_item = function() {
    var todo_item;
    todo_item = {
      desc: $scope.todo_itemDesc
    };
    $scope.todo_items.push(todo_item);
    return this.todo_itemService.create(todo_item);
  };
});