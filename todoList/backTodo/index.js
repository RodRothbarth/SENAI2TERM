import ToDoController from './src/controllers/toDoController'

const express = require('express');

//cria a api
const app = express();

app.use(express.json());

app.get('/toDo', ToDoController.get);

app.post('/toDo', ToDoController.post);

app.put('/toDo/:id',ToDoController.put);

app.delete('/toDo/:id', ToDoController.delete);


//listen the requests
app.listen(3000, ()=>{
    console.log('Listening requests');
});