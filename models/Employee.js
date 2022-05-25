const { Schema } = require("mongoose");

exports.Employee = new Schema({
  first_name: String,
  last_name: String,
});
