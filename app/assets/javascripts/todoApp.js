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

  $scope.addTodo = function(){
    $scope.todos.push($scope.newTodo);
  }
}]);



// csrf token config

// app.config(function($httpProvider) {
//   var authToken;
//   authToken = $("meta[name=\"csrf-token\"]").attr("content");
//   return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
// });


