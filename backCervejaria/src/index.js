import './src/dataBase/dataBase.js'
import './src/controller/cervejaController'

const express = require('express')
const app = express()

const cervejaController = require('./controllers/cervejaController')

app.use(express.json())

app.get('/cervejas', cervejaController.index);

// app.post('/carros', carroController.store);

// app.delete('/carros/:modelo', carroController.delete)

// app.listen(3333, () =>{
// });
