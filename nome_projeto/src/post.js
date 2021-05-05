import React from "react";

import {
        View, 
        ScrollView, 
        Image, 
        Text
    } from "react-native"

const Post = (props)=>{
    return (
        <View>
            <ScrollView>
                <Image style={{width:300, height:300}} source={{uri: props.uri}} />
                <Text>{props.texto}</Text>
            </ScrollView>            
        </View>
    )
}

export default Post
