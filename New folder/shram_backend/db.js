// db.js
const mongoose = require('mongoose');

// ✅ Added database name `shram_setu`
mongoose.connect(
  'mongodb+srv://vishalbhilwariya:root@cluster0.ub5zu7h.mongodb.net/shram_setu?retryWrites=true&w=majority&appName=Cluster0',
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
).then(() => {
  console.log('✅ Connected to MongoDB Atlas');
}).catch((err) => {
  console.error('❌ MongoDB connection error:', err);
});
