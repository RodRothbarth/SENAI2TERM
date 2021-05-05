import mongoose from 'mongoose'

class DataBase {

// constructor(){
//     this.mongo();
// }

    mongo(){
        this.mongoConnection = mongoose.connect(
        'mongodb://localhost:27017/cervejas', 
        {
        useNewUrlParser: true,
        useFindAndModify: true
        })
    };
}

export default new DataBase();