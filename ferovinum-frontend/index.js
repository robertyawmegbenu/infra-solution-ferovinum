const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from the Ferovinum frontend!');
});

app.listen(port, () => {
  console.log(`Frontend running on port ${port}`);
});
