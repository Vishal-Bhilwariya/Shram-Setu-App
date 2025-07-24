// routes/authRoute.js
const express = require('express');
const router = express.Router();
const User = require('../models/User');

// ✅ Registration
router.post('/register', async (req, res) => {
  try {
    console.log("📩 Received registration:", req.body); // ✅ Add this

    const newUser = new User(req.body);
    const saved = await newUser.save();
    console.log("✅ Saved to DB:", saved);

    res.status(201).send({ message: 'User registered successfully' });
  } catch (err) {
    console.error("❌ Error saving user:", err);
    res.status(500).send({ message: 'Error registering user', error: err });
  }
});

// ✅ Login
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ email, password });
    if (!user) return res.status(400).send({ message: 'Invalid credentials' });

    res.status(200).send({ message: 'Login successful', user });
  } catch (err) {
    console.error("❌ Login error:", err);
    res.status(500).send({ message: 'Login error', error: err });
  }
});

module.exports = router;
