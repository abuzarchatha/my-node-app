<<'EOF'
const express = require('express');
const app = express();

const PORT = process.env.PORT || 8080;
const VERSION = process.env.VERSION || 'dev';

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/version', (req, res) => {
  res.json({ version: VERSION });
});

app.listen(PORT, () => {
  console.log(`🚀 API listening on http://0.0.0.0:${PORT}`);
});
EOF
