User = require("../models/index").User
exports.showLogin = (req, res) ->
  
  # req.session._loginReferer = req.headers.referer;
  console.log "show login page"
  res.render "sign/signin"

exports.signin = (req, res) ->
  username = req.body.username.trim()
  password = req.body.password.trim()
  User.findOne
    username: username
    password: password
  , (err, user) ->
    if err
      console.log "error while finding user"
    else
      res.render "index"  if user.role is "admin"

