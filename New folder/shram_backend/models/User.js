// models/User.js
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  role: String,
  firstName: String,
  lastName: String,
  email: String,
  phone: String,
  password: String,
  dob: String,
  address: String,
  city: String,
  state: String,
  pincode: String,
  experience: String,
  skill: String,
  salary: String,
  companyName: String,
  workLocation: String,
  jobType: String,
  preferredSkill: String
});

module.exports = mongoose.model('User', userSchema); // collection = users
