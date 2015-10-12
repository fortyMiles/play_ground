var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

data = [{"sender":"Jhon", "message":"hello come here"}];
app.get('/', function(req, res){
	res.sendfile('index.html');
});

io.on('connection', function(socket){
	socket.on('chat message', function(msg){
		console.log('message: ' + msg);
	});

	console.log('a user connected');

	socket.on('disconnect', function(){
		console.log('user disconnected');
	});
});

http.listen(3000, function(){
	console.log('listening on *: 3000');
});

