//Request Handler/Load the FrontEnd
var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.set('port', (process.env.PORT || 5000));
app.use(express.static(__dirname + '/public'));
app.set('views', __dirname + '/');
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());



app.get('/', function(req, res){
    res.render('fe.html');
});

app.get('/:act/:chanel', function(req, res){
   // res.send('');
    console.log(req.params.act);
});

app.listen(app.get('port'), function() {
});
