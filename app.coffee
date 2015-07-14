baseUrl = 'https://staging.remontnik.ru/';

app = angular.module('RemontnikApp', ['ngResource'])
app.factory 'Portfolio', ($resource) ->
  $resource(baseUrl.concat('api/v1/portfolio/all/'))

app.config ($resourceProvider) ->
# API принудительно редиректит на адрес со слешем на конце.
# Angular же этот слеш принудительно обрезает. Исправим это:
  $resourceProvider.defaults.stripTrailingSlashes = false
  return

app.controller 'PortfolioController', ($scope, Portfolio) ->
# Сразу загрузим портфолио
  Portfolio.get (data) ->
    $scope.portfolioItems = data.results

  # Получает абсолютный путь из относительного
  $scope.getAbsolutePath = (relativePath) ->
    baseUrl.concat(relativePath)



