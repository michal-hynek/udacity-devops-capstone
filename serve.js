var static = require('node-static');
var dotenv = require('dotenv');
var file = new static.Server('./');
var defaultPort = 4000;

dotenv.config();

require('http').createServer(function (request, response) {
    request.addListener('end', function () {
        file.serve(request, response);
    }).resume();
}).listen(process.env.PORT || defaultPort);

console.log(`Serving on http://localhost:${process.env.PORT || defaultPort}/`);
