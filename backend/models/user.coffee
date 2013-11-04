mongoose = require("mongoose")
userSchema = mongoose.Schema(
  username: String
  password: String
  role: String
)
User = mongoose.model("User", userSchema)
