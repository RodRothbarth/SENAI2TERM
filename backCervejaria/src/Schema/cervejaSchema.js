import mongoose from 'mongoose'
const cervejaSchema = new mongoose.Schema({
    marca:{
        type:String, 
        required: true,
    },
    tipo:{
        type:String,
    required: true, },
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

module.exports = new mongoose.model('cervejas', cervejaSchema);


// class carroModel{

//     async index(req, res){
//     return res.json

// }