const express = require('express');
const app = express();

const PORT = process.env.PORT || 8080;
const VERSION = process.env.VERSION || 'dev';

// Health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

// Version endpoint
app.get('/version', (req, res) => {
  res.json({ version: VERSION });
});

app.listen(PORT, () => {
  console.log(`API listening on port ${PORT}`);
});
