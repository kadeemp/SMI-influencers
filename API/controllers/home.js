module.exports = function(app) {

	app.get('/', function(req, res) { 
		res.send("You made a GET request to /");
	});

	app.get('/users/:uid', function(req, res) { 
		res.send("You made a GET request to /users/" + req.params.uid);
	});

}