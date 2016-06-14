var app = angular.module('todoApp', ['ngResource']);

// AngularJS & TurboLinks fix
// $(document).on('ready page:load', function() {
//     angular.bootstrap(document.body, ['todoApp']);
// });

// TodoListService
app.factory('models', ['$resource', function($resource){
  var todo_lists_model = $resource("/api/todo_lists/:todo_list_id/todo_items/:id.json", {id: @id});
  var x = {
    todo_lists: todo_lists_model,
  };
  return x;
};

// TodoList Controller
app.controller('TodoListCtrl', ['$scope', 'models', function ($scope, models){

  $scope.todo_lists = models.todo_lists.query();

  // Add to list
  // $scope.addTodo = function(){
  //   $scope.newTodo.id = ($scope.todos.length) + 1;
  //   newTodo = models.todo_items.get({id: todo_list.id});
  //   $scope.newTodo.push(newTodo)
  //   $scope.newTodo = '';
  // }

  // $scope.deleteTodo = function(todo){
  //   $scope.todos.splice($scope.todos.indexOf(todo),1);
  // }
}]);




