Category = require("../models/index").Category
exports.json_list = (req, res) ->
  Category.find {}, (err, categories) ->
    if err
      res.send status: "error"
    else
      res.send categories


exports.json_save = (req, res) ->
  category = new Category(name: req.body.name)
  category.save (err, cate) ->
    unless err
      res.send
        status: "success"
        category: cate



exports.json_delete = (req, res) ->
  console.log req.params["id"]
  Category.remove
    _id: req.params["id"]
  , (error) ->
    if error
      console.log "delete error", error
    else
      console.log "delete success"

