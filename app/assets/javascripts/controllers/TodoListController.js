angular.module('todoApp').controller("TodoListController", ['$scope', 'Todo_item', function($scope, Todo_item){
  console.log("starting controller");

  function TodoListController($scope, Todo_item) {
  $scope.init = function(todoListId) {
    this.Todo_item = new Todo_item(todoListId);
    return $scope.Todo_items = this.Todo_item.all();
  };
  return $scope.addTodo_item = function() {
    var todo_item;
    todo_item = {
      desc: $scope.Todo_itemDesc
    };
    $scope.todo_items.unshift(todo_item);
    this.Todo_item.create(todo_item);
    return $scope.todo_itemDesc = "";
  };
  return $scope.toggleTodo_item = function(todo_item) {
    return this.Todo_item.update(todo_item, {
      completed: todo_item.completed
    });
  };
}
}]);
