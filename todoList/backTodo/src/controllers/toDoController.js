import todoSchema from '../schema/todo_schema'

class ToDoController{

    async get(req, res){
        const toDo = await todoSchema.find().catch(error => console.log(error) )
        return res.send(toDo);
    }

    async post(req, res){
        const {id, titulo, descricao} = req.body;

        await todoSchema.create({id, titulo, descricao})
        .catch(error => {
            console.log(error);
        });
        return res.send({id, titulo, descricao})
    }

    async put(req, res){
        await todoSchema.create({id, titulo, descricao})
        .catch(error => {
            console.log(error);
        });
        return res.send(req.body)
    }

    async delete(req, res){
        todoSchema.find({"id": req.param.id}).catch(error => console.log(error) )
        .then((result=>{
            if(result){console.log("deu aki")}
            todoSchema.deleteOne({"id": req.param.id})
        .catch(error => {
            console.log(error);
        });
            
        }))
     
        return res.json("req.body")
    }


}

export default new ToDoController(); 