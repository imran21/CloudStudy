const mysql = require('mysql');
const express = require('express');
const bodyparser = require('body-parser');
var http = require('http');
var app = express();
//Configuring express server
app.use(bodyparser.json());


var mysqlConnection = mysql.createConnection({
host: 'channel-db.ctzyzaywsd4a.us-east-1.rds.amazonaws.com',
user: 'admin',
password: 'admin123',
database: 'channel_db',
multipleStatements: true
});

mysqlConnection.connect((err)=> {
if(!err)
console.log('Connection Established Successfully');
else
console.log('Connection Failed!'+ JSON.stringify(err,undefined,2));
});


app.get('/:id/:channel',function(req,res,next){
        console.log(req.params.id+" "+req.params.channel);
        var id=req.params.id;
        var channel=req.params.channel;
        var query='SELECT * FROM reward_details where id='+id+' AND Channel="'+channel+'"'
        console.log(query)
        mysqlConnection.query(query, (err, result, fields) => {
                if (!err)
                        //res.send(rows[0][id]);
                        Object.keys(result).forEach(function(key) {
                        var row = result[key];
                        console.log("The Requested user is :"+row.id+" "+row.Channel+" "+row.Reward)
                        res.end("The Requested user is :"+row.id+" "+row.Channel+" "+row.Reward)
                        });
        });
       res.end("Data Available")
});


const port = process.env.PORT || 2000;
app.listen(port, () => console.log(`Listening on port ${port}..`));

