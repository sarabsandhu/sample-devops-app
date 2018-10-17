// Sample node.js web app for Pluralsight Docker CI course
// For demonstration purposes only
'use strict';

var os = require("os");
var path = require("path");

var express = require('express'),
    app = express();

app.set('views', 'views');
app.set('view engine', 'pug');
app.use("/public", express.static(path.join(__dirname, 'public')));

const commitRef = process.env.APP_COMMIT_REF || 'N/A'
const buildDate = process.env.APP_BUILD_DATE || new Date().toString()


var hostname = os.hostname();

app.get('/', function(req, res) {
    res.render('home', {commitReference:commitRef, currentBuildDate:buildDate, myInstance:hostname});
});

app.listen(3000);
module.exports.getApp = app;