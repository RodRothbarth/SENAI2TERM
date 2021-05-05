import mapaController from './controllers/mapaController';
import express from 'express';
import './dataBase/dataBase'

//cria a api
const app = express();


app.use(express.json());


//requests
app.get('/mapa', mapaController.get);

app.post('/mapa', mapaController.post);

app.put('/mapa/:id',mapaController.put);

app.delete('/mapa', mapaController.delete);

//listen the requests
app.listen(3000, ()=>{
    console.log('Listening requests');
});