const mongoose = require('mongoose')
const carroSchema = new mongoose.Schema({
    modelo:{
        type:String
    },
    ano_fabricacao:{
        type:Number }
    // ,
    // cor:{
    //     type:String
    // },
    // marca:{
    //     type:String
    // },
    // kmtragem:{
    //     type:Number
    // },
    // acessorios:{
    //     type:String
    // },
    // chassi:{
    //     type:String
    // }
})

module.exports = new mongoose.model('carros', carroSchema);


// class carroModel{

//     async index(req, res){
//     return res.json

// }