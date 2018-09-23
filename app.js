var express = require('express');
var app = express();
var cors = require('cors');
app.use(express.json());
app.use(cors());
const port = 3000;

var apiRouter = require('./routes/api');

app.use('/api/v1', apiRouter);

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

module.exports = app;