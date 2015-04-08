describe 'directives', ->  
  beforeEach module('cafeTownsend')

  beforeEach inject ($compile, $rootScope) ->
    @scope = $rootScope
    element = angular.element(
      '<form name="employeeForm">' +
      '<input type="text" ng-model="createEmployeeCtrl.selectedEmployee.startDate" name="date" date-format-validator />' +
      '<input type="email" ng-model="createEmployeeCtrl.selectedEmployee.email" name="email" email-format-validator />' +
      '</form>'
    )

    @scope.model = { date: null, email: null }
    $compile(element) @scope
    @form = @scope.employeeForm

  describe 'dateFormatValidator', ->
    it 'should pass with correct date pattern', ->
      @form.date.$setViewValue('1992-11-20')
      @scope.$digest()
      expect(@form.date.$valid).to.be(true)

    it 'should fail with incorrect date pattern', ->
      @form.date.$setViewValue('19921120')
      @scope.$digest()
      expect(@form.date.$valid).to.be(false)

  describe 'emailFormatValidator', ->
    it 'should pass with correct email pattern', ->
      @form.email.$setViewValue('isha@test.com')
      @scope.$digest()
      expect(@form.email.$valid).to.be(true)

    it 'should fail with incorrect email pattern', ->
      @form.email.$setViewValue('khjghjbkj')
      @scope.$digest()
      expect(@form.email.$valid).to.be(false)
