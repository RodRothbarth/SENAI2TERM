import mapaController from './src/controllers/mapaController'

const express = require('express');

//cria a api
const app = express();

app.use(express.json());

app.get('/mapa', mapaController.get);

app.post('/mapa', mapaController.post);

app.put('/mapa/:id',mapaController.put);

app.delete('/mapa/:id', mapaController.delete);


//listen the requests
app.listen(3000, ()=>{
    console.log('Listening requests');
});