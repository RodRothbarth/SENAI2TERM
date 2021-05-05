import React, { useState } from "react";
import { View, 
        StyleSheet, 
        } from "react-native";
import Post from "./src/post"

const HelloWorld = () => { 

const [name, setName] = useState("");
const [mensagem, setMensagem] = useState("");

    return (
        <View style={styles.container}>
            <Post uri={'https://danielmiessler.com/images/url-uri-url-miessler-2020.png'} texto={escrito}></Post>
        </View>    
        )
 }

 const logo = {
     uri:'http://s2.glbimg.com/Wbzg3io0pmCPhSvIBQGz7gGL3W8=/0x0:1185x700/695x411/s.glbimg.com/po/tt2/f/original/2014/06/11/untitled-5.jpg' 
 }

 const escrito = "qqr coisa"
 const styles = StyleSheet.create({
    container: {
        paddingTop: 20,
        flex:1, 
        },
       input: {
           borderWidth:4, 
           borderColor:'#000', 
           color:'#000',
           width: 400,
           borderRadius:20,
           textAlign: "center",
           alignSelf: "center"
        }
 })

const helloPessoa = (nome)=>{
    return "Hello " + nome + "!";
 }
 
 export default HelloWorld

