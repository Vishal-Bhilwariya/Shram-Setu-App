// server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const app = express();
require('./db'); // ✅ Connect to DB

app.use(cors());
app.use(express.json());
app.use(bodyParser.json());
app.use('/', require('./routes/authRoutes')); // ✅ Routes for /register and /login

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
