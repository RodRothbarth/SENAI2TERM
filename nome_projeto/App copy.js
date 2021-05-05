import React, { useState } from "react";
import { View, 
        StyleSheet, 
        Text, 
        TextInput,
        // Button,
        TouchableOpacity,
        ScrollView,
        Image} from "react-native";
import Post from "./src/post"

const HelloWorld = () => { 

const [name, setName] = useState("");
const [mensagem, setMensagem] = useState("");

    return (
        <View style={styles.container}>
            <TextInput onChangeText={text=>setName(text)} style={styles.input} defaultValue={name}></TextInput>
            <Text style={{color: '#000'}}>{mensagem}</Text>
            {/* <Button style={{  }} onPress={()=>{ setMensagem(helloPessoa(name)) }} title="Confirmar" ></Button>   */}
            <TouchableOpacity style={{ elevation: 8, backgroundColor: "#009688", borderRadius: 10, paddingVertical: 10, paddingHorizontal: 12, width:400, alignSelf: "center", alignItems:"center"
    }} onPress={()=>{ setMensagem(helloPessoa(name)) }}><Text>"Confirmar"</Text></TouchableOpacity>         
    
            <Image style={{width:200, height:200}} source={logo} />
        
            <ScrollView>
                <Text>
                Mussum Ipsum, cacilds vidis litro abertis. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget. Não sou faixa preta cumpadi, sou preto inteiris, inteiris. In elementis mé pra quem é amistosis quis leo. Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.

Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Atirei o pau no gatis, per gatis num morreus. Aenean aliquam molestie leo, vitae iaculis nisl.

Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Diuretics paradis num copo é motivis de denguis. Sapien in monti palavris qui num significa nadis i pareci latim. Per aumento de cachacis, eu reclamis.

Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio. Cevadis im ampola pa arma uma pindureta. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.

A ordem dos tratores não altera o pão duris. Admodum accumsan disputationi eu sit. Vide electram sadipscing et per. Leite de capivaris, leite de mula manquis sem cabeça. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.

Suco de cevadiss deixa as pessoas mais interessantis. Viva Forevis aptent taciti sociosqu ad litora torquent. Si num tem leite então bota uma pinga aí cumpadi! Manduma pindureta quium dia nois paga.

Delegadis gente finis, bibendum egestas augue arcu ut est. Detraxit consequat et quo num tendi nada. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Quem num gosta di mé, boa gentis num é.

Quem num gosta di mim que vai caçá sua turmis! Mé faiz elementum girarzis, nisi eros vermeio. Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis. Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis.

Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl. Interagi no mé, cursus quis, vehicula ac nisi. Casamentiss faiz malandris se pirulitá. Quem manda na minha terra sou euzis!

Copo furadis é disculpa de bebadis, arcu quam euismod magna. Paisis, filhis, espiritis santis. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Pra lá , depois divoltis porris, paradis.
                </Text>
            </ScrollView>
            <Post uri={'https://danielmiessler.com/images/url-uri-url-miessler-2020.png'}></Post>
        </View>    
        )
 }

 
 const logo = {
     uri:'http://s2.glbimg.com/Wbzg3io0pmCPhSvIBQGz7gGL3W8=/0x0:1185x700/695x411/s.glbimg.com/po/tt2/f/original/2014/06/11/untitled-5.jpg' 
 }

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

