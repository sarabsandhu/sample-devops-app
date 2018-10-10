// Sample node.js web app for Pluralsight Docker CI course
// For demonstration purposes only
'use strict';

var express = require('express'),
    app = express();

app.set('views', 'views');
app.set('view engine', 'pug');

const commitRef = process.env.APP_COMMIT_REF || 'N/A'
const buildDate = process.env.APP_BUILD_DATE || new Date().toISOString()

app.get('/', function(req, res) {
    res.render('home', {commitReference: commitRef, currentBuildDate:buildDate});
});

app.listen(3000);
module.exports.getApp = app;