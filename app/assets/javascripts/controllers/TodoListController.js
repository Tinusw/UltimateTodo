var app = angular.module('todoApp')

app.controller('TodoListController', function($scope, Todo){
  $scope.init = function(todolistId) {
    this.todo_itemService = new Todo_item(todoListId)
    return $scope.todo_items = this.todo_itemsService.all()
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