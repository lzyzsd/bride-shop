fs = require("fs")
path = require("path")
exports.index = (req, res) ->
  publicDir = path.resolve(__dirname + "/..")
  console.log publicDir
  fs.readFile publicDir + "/public/manage.html", "utf8", (err, text) ->
    res.send text

