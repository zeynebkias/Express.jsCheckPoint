const http = require ('http')

//create a server object : 
http.createServer(function (req, res) {
res.writeHead(200); // status code in header
res.write('introduction'); //response body // res.send
res.end(); //close the connection

}).listen(8080); //port in which node will listen for connetions

console.log('listening on port 8080');