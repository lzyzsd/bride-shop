express = require "express"
user = require "./backend/controllers/user"
product = require "./backend/controllers/product"
category = require "./backend/controllers/category"
sign = require "./backend/controllers/sign"
admin = require "./backend/controllers/admin"
http = require "http"
path = require "path"
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/backend/views"
app.set "view engine", "ejs"
app.use express.favicon()
app.use express.logger "dev"
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser "your secret here"
app.use express.session()
app.use app.router
# app.use require("stylus").middleware(__dirname + "/backend/public")
app.use '/', express.static(path.join(__dirname, "/front/app"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")
# app.get "/", product.list
# app.get "/users", user.list
# app.get "/products", product.list
app.get "/products.json", product.json_list
app.post "/products.json", product.json_save

app.delete '/products.json/:id', product.json_delete
app.get "/categories.json", category.json_list
app.post "/categories.json", category.json_save

app.delete '/categories.json/:id', category.json_delete
app.get "/signin", sign.showLogin
app.post "/signin", sign.signin
app.get "/admin", admin.index
app.get "/fileupload", (req, res) ->
  res.render "fileupload"

app.post "/fileupload", product.upload
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

