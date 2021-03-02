const carroSchema = require('./carroSchema');

class carroController {
  async index( req,res)  {
    carroSchema.find({})
    .then((result)=>{
      return res.json(result)
    })
    .catch((error)=>{
      return res.json({"massage": "Não achou!"})
    })
  }

  async store (req, res){
    carroSchema.create(req.body)
    .then((result)=>{
      console.log(result)
      return res.json(result)
    })
    .catch((error)=>{
      return res.json({"massage": "Não Salvou!" + error})
    })
    return res.json(req.body);
  }

  async delete (res,req){
    carroSchema.find({'modelo': req.param.modelo})
    .then((result)=>{
      console.log(result)
      return res.json(result)
    })
    .catch((error)=>{
      return res.json({"massage": "Não deletou!" + error})
    })
  }
}

module.exports = new carroController();

// async transforma em função sincrona que coloca await. que só passa para o proximo comando se ele tiver um retorno. 