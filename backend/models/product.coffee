mongoose = require("mongoose")
productSchema = mongoose.Schema(
  name: String
  url: String
  title: String
  category: String
  description: String
)
Product = mongoose.model("Product", productSchema)
