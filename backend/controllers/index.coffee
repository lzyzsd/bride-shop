Category = require("../models/index").Category

#
# * GET home page.
# 
exports.index = (req, res) ->
  Category.find {}, (err, categories) ->
    unless err
      
      # res.send({status: 'error'});
      res.render "index",
        title: "Express"
        categories: categories


