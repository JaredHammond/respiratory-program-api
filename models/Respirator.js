import mongoose from 'mongoose';
const { Schema } = mongoose;

const RespiratorSchema = new Schema({
  manufacturer: { type: String, required: true },
  model: { type: String, required: true },
  size: { type: String, enum: ['Small', 'Medium', 'Large', 'N/A'], required: true},
  fit_test_required: { type: Boolean, required: true },
  type: { type: String, required: true },
  protection_type: { type: String, enum: ['Air Purifying', 'Supplied Air']}
});

export const Respirator = mongoose.model("Respirator", RespiratorSchema);