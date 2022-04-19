const http = require('http');
const server = http.createServer();
const PORT = process.argv[2];


if (PORT == undefined) {
  console.log("Please provide a port");
  process.exit(1);
}

console.log("Running server on port " + PORT);

server.on('request', (request, response) => {
    let body = [];
    request.on('data', (chunk) => {
        body.push(chunk);
    }).on('end', () => {
        body = Buffer.concat(body).toString();

	console.log(`==== ${request.method} ${request.url}`);
	console.log('> Headers');
        console.log(request.headers);

	console.log('> Body');
	console.log(body);
        response.end();
    });
}).listen(PORT);
