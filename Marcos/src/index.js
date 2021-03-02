// import {express} from "express";

const express = require('express')
const mongoose = require('mongoose')
const app = express()
//const port = 3000
const carroController = require('./carroController')


mongoose.connect('mongodb://localhost:27017/carros')
  .then(()=> {
    console.log('Conectou, vai la seja feliz!')
  }) 
  .catch((error)=>{
    console.log('Deu não!', error)
  })
  .finally(()=>{
    console.log("sempre passa aqui!")
  });

// app.get('/', (req, res) => {
//   res.send('Hello World!')
// })

// app.listen(port, () => {
//   console.log(`Example app listening at http://localhost:${port}`)
// })

app.use(express.json())

app.get('/carros', carroController.index);

app.post('/carros', carroController.store);

app.delete('/carros/:modelo', carroController.delete)

app.listen(3333, () =>{
});
