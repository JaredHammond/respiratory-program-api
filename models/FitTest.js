import mongoose from 'mongoose';
const { Schema } = mongoose;

const FitTestSchema = new Schema({
  employee: { type: Schema.types.ObjectId, ref: 'Employee', required: true },
  respirator: { type: Schema.types.ObjectId, ref: 'Respirator', required: true },
  date: { type: Date, default: Date.now, required: true },
  protocol: { type: String, enum: ['Bitrex', 'Isoamyl Acetate', 'Saccharin', 'Irritant Smoke'], required: true },
  pass: { type: Boolean, required: true },
  comments: { type: String }
});

export const FitTest = mongoose.model("FitTest", FitTestSchema);