const express = require('express');
const app = express();
const path = require('path');


app.get('/',function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
});

app.get('/index.html',function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
});


app.get('/css/bootstrap.min.css',function(req,res){
  res.sendFile(path.join(__dirname+'/css/bootstrap.min.css'));
});

app.get('/css/estilos.css',function(req,res){
  res.sendFile(path.join(__dirname+'/css/estilos.css'));
});

app.get('/registro_contaminante.html',function(req,res){
  res.sendFile(path.join(__dirname+'/registro_contaminante.html'));
});


app.listen(3000,function(){
  console.log("servidor activo");
})
