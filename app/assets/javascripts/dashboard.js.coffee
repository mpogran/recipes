recipes = angular.module 'recipes', []

recipes.controller 'browser', ['$scope', '$http', ($scope, $http) ->
  $scope.items = []

  $scope.$watch "dirId", ->
    $http.get("/containers/#{$scope.dirId}.json").success (data) ->
      console.log data.items
      $scope.items = data.items
      return

  $scope.createDir = ->
    return
]
