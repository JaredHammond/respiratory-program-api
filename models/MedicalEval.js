import mongoose from 'mongoose';
const { Schema } = mongoose;

const MedicalEvalSchema = new Schema({
  employee: { type: Schema.types.ObjectId, ref: 'Employee', required: true },
  plhcp: { type: String, required: true },
  eval_date: { type: Date, required: true },
  passed: { type: Boolean, require: true },
  comments: { type: String }
});

export const MedicalEval = mongoose.model("MedicalEval", MedicalEvalSchema);