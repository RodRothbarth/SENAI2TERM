import mongoose from 'mongoose';

const todoSchema = new mongoose.Schema(

    {
        id:{
            type: String,
             
        },

        titulo:{
            type:String,
            
        },
        descricao:{
            type:String
        }
    }
    
);

export default mongoose.model("toDo", todoSchema);