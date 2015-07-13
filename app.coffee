baseUrl = 'https://staging.remontnik.ru/';

app = angular.module('RemontnikApp', ['ngResource'])
app.factory 'Portfolio', ($resource) ->
  $resource(baseUrl.concat('api/v1/portfolio/all'))

app.controller 'PortfolioController', ($scope, Portfolio) ->
  # Сразу загрузим портфолио
  Portfolio.get (data) ->
    $scope.portfolioItems = data.results

  # Получает абсолютный путь из относительного
  $scope.getAbsolutePath = (relativePath) ->
    baseUrl.concat(relativePath)



