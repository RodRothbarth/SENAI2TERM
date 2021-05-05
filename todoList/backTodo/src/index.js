import ToDoController from './controllers/toDoController';
import express from 'express';
import './dataBase/dataBase'

//cria a api
const app = express();


app.use(express.json());


//requests
app.get('/todo', ToDoController.get);

app.post('/todo', ToDoController.post);

app.put('/todo/:id',ToDoController.put);

app.delete('/todo', ToDoController.delete);

//listen the requests
app.listen(3000, ()=>{
    console.log('Listening requests');
});