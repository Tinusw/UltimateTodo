var app = angular.module('todoApp', ['ngResource']);

// csrf token config

app.config(function($httpProvider) {
  var authToken;
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});

// service

app.factory('todo_items', function($resource) {
  var Todo_item;
  return Todo_item = (function() {
    function Todo_item(todoListId) {
      this.service = $resource('/api/todo_lists/:todo_list_id/todo_items', {
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

// controller

app.controller("TodoListController", function($scope, 'todo_item) {
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
};

