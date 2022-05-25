import mongoose from 'mongoose';
const { Schema } = mongoose;

exports.FitTest = new Schema({
  employee: { type: Schema.types.ObjectId, ref: 'Employee' },
  respirator: { type: Schema.types.ObjectId, ref: 'Respirator' },
  date: { type: Date, default: Date.now },
  
});
