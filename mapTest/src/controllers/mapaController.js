import mapa from '../schema/mapa_schema';

class MapaController{

    async get(req, res){
        const mapa = await mapa.find().catch(error => console.log(error) )
        return res.send(mapa);
    }

    async post(req, res){
        const {id, titulo, descricao} = req.body;

        await mapa.create({id, titulo, descricao})
        .catch(error => {
            console.log(error);
        });
        return res.send({id, titulo, descricao})
    }

    async put(req, res){
        await mapa.create({id, titulo, descricao})
        .catch(error => {
            console.log(error);
        });
        return res.send(req.body)
    }

    async delete(req, res){
        mapa.find({"id": req.param.id}).catch(error => console.log(error) )
        .then((result=>{
            if(result){console.log("deu aki")}
            mapa.deleteOne({"id": req.param.id})
        .catch(error => {
            console.log(error);
        });
            
        }))
     
        return res.json("req.body")
    }


}

export default new MapaController(); 