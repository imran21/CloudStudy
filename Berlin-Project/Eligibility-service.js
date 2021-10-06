//Check if customer is Eligible and Send the Account number to Rewawd service
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
app.get('/eligibility_check/:id/:channel' , (req, res) => {
var id=req.params.id
var channel=req.params.channel
var query='SELECT * FROM acct_detail where id='+id
console.log(id);
console.log(query)
mysqlConnection.query(query, (err, result, fields) => {
if (!err)
//res.send(rows[0][id]);
Object.keys(result).forEach(function(key) {
      var row = result[key];
      console.log(row.id+"------>"+row.Eligible)
       if(row.Eligible == 'yes')
        {
        console.log("CUSTOMER_ELIGIBLE")
        var options = {
                        host: '54.160.111.78',
                        port: 2000,
                        path: '/'+id+'/'+channel
                    };
  http.get(options, function(resp){
                      resp.on('data', function(chunk){
                      });
                    }).on("error", function(e){
                     // console.log("Got error: " + e.message);
                    });

        }
       else
         {
        console.log("CUSTOMER_INELIGIBLE")
        }
      res.send(row.id+"------>"+row.Eligible);
    });
else
console.log(err);
})
} );

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`Listening on port ${port}..`));
