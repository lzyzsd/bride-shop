sinon = require 'sinon'
request = require 'supertest'
expect = require('chai').expect

Product = require("../../models/index").Product

describe 'product controller', ->
  it 'get /products.json without any query parameters', (done) ->
    spy = sinon.spy Product, 'find'
    spy.withArgs category: 'default'

    paginateSpy = sinon.spy (page, size, calleback) ->
      expect(page).to.equal 1
      expect(size).to.equal 12

    request(app)
    .get('/products.json')
    .expect('Content-Type', /json/)
    .expect(200)
    .end (err, res) ->
      throw err if err
      expect(spy.withArgs(category: 'default').calledOnce).to.equal true
      spy.restore()
      done()

  it 'get /products.json?page=2', (done) ->
    spy = sinon.spy Product, 'find'
    spy.withArgs category: 'default'

    paginateSpy = sinon.spy (page, size, calleback) ->
      expect(page).to.equal 2
      expect(size).to.equal 12

    spy.paginate = paginateSpy

    request(app)
    .get('/products.json')
    .query(page: 2)
    .expect('Content-Type', /json/)
    .expect(200)
    .end (err, res) ->
      throw err if err
      expect(spy.withArgs(category: 'default').calledOnce).to.equal true
      spy.restore()
      done()

  it 'get /products.json?category=test', (done) ->
    spy = sinon.spy Product, 'find'
    spy.withArgs category: 'test'

    paginateSpy = sinon.spy (page, size, calleback) ->
      expect(page).to.equal 1
      expect(size).to.equal 12

    request(app)
    .get('/products.json')
    .query(category: 'test')
    .expect('Content-Type', /json/)
    .expect(200)
    .end (err, res) ->
      throw err if err
      expect(spy.withArgs(category: 'test').calledOnce).to.equal true
      spy.restore()
      done()

  it 'get /products.json?category=test&page=2', (done) ->
    spy = sinon.spy Product, 'find'
    spy.withArgs category: 'test'

    paginateSpy = sinon.spy (page, size, calleback) ->
      expect(page).to.equal 2
      expect(size).to.equal 12

    request(app)
    .get('/products.json')
    .query(
      category: 'test'
      page: 2
    )
    .expect('Content-Type', /json/)
    .expect(200)
    .end (err, res) ->
      throw err if err
      expect(spy.withArgs(category: 'test').calledOnce).to.equal true
      spy.restore()
      done()