import mongoose from "mongoose";
const { Schema } = mongoose;

const EmployeeSchema = new Schema({
  first_name: { type: String, required: true },
  last_name: { type: String, required: true },
  work_unit: { type: String },
  current_employee: { type: Boolean, default: true },
  active: { type: Boolean, default: true },
  appendix_d_file: { type: String }
});

EmployeeSchema.virtual('name').get(function() {
  return `${this.first_name} ${this.last_name}`;
});

export const Employee = mongoose.model("Employee", EmployeeSchema);