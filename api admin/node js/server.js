const express = require('express')
const mysql =require('mysql')
const http = require ('http')
const bodyParser = require('body-parser')
const assert = require('assert')


const cors = require('cors')
const { ObjectID } = require('mongodb')
const { query } = require('express')
const { stringify } = require('querystring')
const { json } = require('body-parser')
const app = express()
app.use(bodyParser.json())
app.use(cors())
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "mtech"
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    const server = http.createServer((req, res) => {
        res.setHeader('Content-Type', 'text/html');
        res.setHeader('X-Total-Count', 1);
        res.writeHead(200, { 'Content-Type': 'text/plain' });
        res.end('ok');
      });


app.get("/mobilist" ,(req,res)=>{
    con.query("SELECT id,name,ecran,camera,cpu,battery,memory,ram,price,_date,categories.cat_name AS Category,image_url AS Image,add_last_update,resolution,camera_f AS Camera_Frontale FROM mobilist JOIN categories ON mobilist.mob_cat=categories.cat_id", function (err, result, fields) {
        if (err) throw err;
        var total = fields.length
        res.header('Access-Control-Expose-Headers', 'X-Total-Count')
        res.setHeader('X-Total-Count',total)
        
        res.send(result)
        
      });
} )



app.get("/users" ,(req,res)=>{
  con.query("SELECT * FROM users", function (err, result, fields) {
      if (err) throw err;
      var total = fields.length
      res.header('Access-Control-Expose-Headers', 'X-Total-Count')
      res.setHeader('X-Total-Count',total)
      
      res.send(result)
      
    });
} )

app.delete("/users/:id",(req,res)=>{
  var id = req.params.id
con.query('DELETE FROM users WHERE id='+id,function (err, result, fields) {
  if (err) throw err (res.status(400));
  res.status(200)
  res.send(result)
});
})   


app.delete("/mobilist/:id",(req,res)=>{
    var id = req.params.id
  con.query('DELETE FROM mobilist WHERE id='+id,function (err, result, fields) {
    if (err) throw err (res.status(400));
    res.status(200)
    res.send(result)
  });
})

app.delete("/post/:id",(req,res)=>{
  var id = req.params.id
con.query('DELETE FROM post WHERE id='+id,function (err, result, fields) {
  if (err) throw err (res.status(400));
  res.status(200)
  res.send(result)
});
}) 

app.get("/post" ,(req,res)=>{
  con.query("SELECT post.id,content,users.fullname AS Username ,image,post_like AS Likes FROM post JOIN users ON post.post_user = users.id", function (err, result, fields) {
      if (err) throw err;
      var total = fields.length
      res.header('Access-Control-Expose-Headers', 'X-Total-Count')
      res.setHeader('X-Total-Count',total)
      
      res.send(result)
      
    });
} )


app.post("/mobilist" , (req,res)=>{
    var data = req.body;   
    var name= data["name"];
    var ecran= data["ecran"];
    var camera= data["camera"];
    var cpu= data["cpu"];
    var battery= data["battery"];
    var memory= data["memory"];
    var ram= data["ram"];
    var resolution= data["resolution"];
    var price= data["price"];
    var _date= data["_date"];
    var mob_cat= data["mob_cat"];
    var Camera_Frontale= data["camera_f"];
    var image_url= data["image_url"];
    var add_last_update= data["add_last_update"];
    console.log(image_url)
    con.query('INSERT INTO mobilist (name,ecran,camera,cpu,battery,memory,ram,price,_date,mob_cat,image_url,add_last_update,resolution,camera_f)VALUES("'+name+'","'+ecran+'","'+camera+'","'+cpu+'","'+battery+'","'+memory+'","'+ram+'","'+price+'","'+_date+'",'+mob_cat+',"'+image_url+'","'+add_last_update+'","'+resolution+'","'+Camera_Frontale+'") ', function (err , result ,fiels){
    
        if (err) throw err;
        res.status(200)
        res.send(result)
      
    })
})
app.put("/mobilist/:id" , (req,res)=>{
  var id = req.params.id
  var data = req.body;   
  var name= data["name"];
  var ecran= data["ecran"];
  var camera= data["camera"];
  var cpu= data["cpu"];
  var Camera_Frontale= data["camera_f"];
  var battery= data["battery"];
  var memory= data["memory"];
  var ram= data["ram"];
  var resolution= data["resolution"];
  var price= data["price"];
  var _date= data["_date"];
  var mob_cat= data["mob_cat"];
  var image_url= data["image_url"];
  var add_last_update= data["add_last_update"];
  console.log(_date)
  con.query('UPDATE mobilist SET name="'+name+'" ,ecran="'+ecran+'",camera="'+camera+'",cpu="'+cpu+'",battery="'+battery+'",memory="'+memory+'",ram="'+ram+'",price="'+price+'",_date="'+_date+'",mob_cat='+mob_cat+',image_url="'+image_url+'",add_last_update='+add_last_update+',resolution="'+resolution+'",camera_f="'+Camera_Frontale+'" WHERE id="'+id+'" ' , function (err , result ,fiels){
  
      if (err) throw err;
      res.status(200)
      res.send(result)
    
  })
  
 
})

app.get("/mobilist/:id",(req,res)=>{
  var id = req.params.id
con.query('SELECT *  FROM mobilist WHERE id='+id,function (err, result, fields) {
  if (err) throw err;
  res.status(200)
  var data =JSON.stringify(result)
  var a = data.length-1
  var dataa= data.substr(1,(data.length-2))
  var resultat = JSON.parse(dataa)
  
    
  res.json(resultat)
  
});
})



  });


        

app.listen(3001,(err)=>{
    if(err){
        console.log('error while running server')
    }else{
        console.log('Server is running on port 3001')
    }
})

