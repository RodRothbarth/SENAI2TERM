import mongoose from 'mongoose';

const mapa = new mongoose.Schema(

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

export default mongoose.model("mapa", mapa);