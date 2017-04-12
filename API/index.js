var express = require('express');
// var bodyParser = require('body-parser');

var app = express();

// routes 
var homeRoute = require('./controllers/home');
homeRoute(app);

// uses the PORT environment variable, if available, otherwise uses port 3000
var port = process.env.PORT || 3000;

// allow requests through socket on port specified
app.listen(port);
console.log('Server running...');