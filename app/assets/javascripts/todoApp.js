var app = angular.module('todoApp', []);

// AngularJS & TurboLinks fix
// $(document).on('ready page:load', function() {
//     angular.bootstrap(document.body, ['todoApp']);
// });

// TodoList Controller
app.controller('TodoListCtrl', ['$scope', function ($scope){
  $scope.todos =[
    {id: 1, title: "wash rug"},
    {id: 2, title: "oil baby"},
    {id: 3, title: "yoogoo"}
  ];
  
  // Add to list
  $scope.addTodo = function(){
    $scope.newTodo.id = ($scope.todos.length) + 1;
    $scope.todos.push($scope.newTodo);
    $scope.newTodo = '';
  }

  $scope.deleteTodo = function(todo){
    $scope.todos.splice($scope.todos.indexOf(todo),1);
  }
}]);



// csrf token config

// app.config(function($httpProvider) {
//   var authToken;
//   authToken = $("meta[name=\"csrf-token\"]").attr("content");
//   return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
// });


