import cervejaSchema from '../cervejaSchema'

class cervejaController {
  async index(req, res){
    const cervejas = await cervejaSchema.find()
    .catch(error => console.log(error));

    console.log(cervejas);

    return res.json(cervejas);
  }

  async store (req, res){
    const {marca, tipo} = req.body;

    cervejaSchema.create({
      marca,
      tipo
    })
    .catch((error)=>{
      return res.json({"massage": "Não Salvou!" + error})
    })
    return res.json({marca, tipo});
  }

}

module.exports = new cervejaController();

// async transforma em função sincrona que coloca await. que só passa para o proximo comando se ele tiver um retorno. 