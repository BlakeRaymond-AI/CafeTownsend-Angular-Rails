describe 'ModalDialog', ->

  beforeEach module('cafeTownsend.services')

  beforeEach inject ($injector) ->
    @service = $injector.get 'ModalDialog'

  afterEach ->
    @service = undefined

  it 'is injectable', ->
    expect(@service).to.be.ok()

  it 'can confirm messages', ->
    @service.confirm("message")
    expect(@service).to.be.ok()
