const express = require('express');
const basicAuth = require('express-basic-auth');

const app = express();
const users = {
    'unique-kangaroo': '244466666',
};

function isAuthorized (username, password, cb) {
    if (users[username] && users[username] === password) {
        return cb(null, true);
    }
    return cb(null, false);
}

app.use(basicAuth({
    authorizeAsync: true,
    authorizer: isAuthorized,
    unauthorizedResponse: {message: 'access denied'},
}));

module.exports = app;
