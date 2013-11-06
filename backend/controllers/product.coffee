require 'mongoose-pagination'
Category = require("../models/index").Category
Product = require("../models/index").Product
fs = require 'fs'
formidable = require 'formidable'
util = require 'util'

exports.get = (req, res) ->
  id = req.params["id"]
  Product.find
    id: 1
  , (error, pro) ->
    if error

    else

  res.json
    id: id
    url: "images/image_1.jpg"
    name: "image_1.jpg"
    address:
      street: "5.Ave"

#
# * GET images listing.
#
exports.list = (req, res) ->
  page = req.query["page"] * 1 or 1
  category = req.query["category"]
  options = {}
  options["category"] = category  if category
  Category.find {}, (err, categories) ->
    unless err
      Product.find(options).paginate page, 12, (err, docs, total) ->
        if err
          res.json status: "error"
        else
          data =
            products: docs
            total: total
            currentPage: page
            totalPage: Math.ceil(total / 12)
            category: category
            categories: categories

          res.render "index", data



exports.json_list = (req, res) ->
  category = req.query['category'] or 'default'
  page = if req.query['page'] then req.query['page']*1 else 1
  options = {}
  options.category = category
  pageSize = 12

  Product.find(options).paginate page, pageSize, (err, products) ->
    res.json products  unless err


exports.edit = (req, res) ->
  id = req.params["id"]
  console.log id + " edited"
  res.json status: "success"

exports.save = (req, res) ->
  product = new Product(
    category: req.body.category
    url: "upload/" + req.body.imageName
    title: req.body.title
    description: req.body.description
  )
  product.save (error, pro) ->
    if error
      res.json status: "error"
    else
      res.json
        status: "success"
        product: pro



exports.json_save = (req, res) ->
  product = new Product(
    category: req.body.category
    url: "upload/" + req.body.imageName
    title: req.body.title
    description: req.body.description
  )
  product.save (error, pro) ->
    if error
      res.json status: "error"
    else
      res.json
        status: "success"
        product: pro



exports.json_delete = (req, res) ->
  Product.remove
    _id: req.params["id"]
  , (error) ->
    if error
      console.log "delete error ", error
    else
      console.log "delete success"


exports.upload = (req, res) ->

  # var form = new formidable.IncomingForm();
  # console.log(form);
  # // console.log(req);
  # form.parse(req, function(err, fields, files) {
  #   res.writeHead(200, {'content-type': 'text/plain'});
  #   console.log('received upload:\n\n');
  #   console.log(util.inspect({fields: fields, files: files}));
  #   res.end('<textarea data-type=\"application/json\">{\"ok\": true, \"message\": \"Thanks so much\"}</textarea>');
  # });
  # console.log(util.inspect(req));
  tmpPath = req.files.upload.path
  fileName = req.files.upload.name
  targetPath = "public/upload/" + fileName
  fs.rename tmpPath, targetPath, (err) ->
    throw err  if err
    fs.unlink tmpPath, ->
      throw err  if err

    res.json
      status: "success"
      name: fileName




# res.end(JSON.stringify({status: 'success', url: '/public/upload/'+fileName}));
# res.end('<textarea data-type=\"application/json\">{status: \"success\"}</textarea>')
exports.test = (req, res) ->
  data =
    user:
      name: "name"
      title: "title"

    detail:
      description: "description"

  console.log data
  res.json data
