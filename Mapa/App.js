import React, { useState } from 'react';
import MapView, {Marker, PROVIDER_GOOGLE} from 'react-native-maps';
import {View, StyleSheet} from 'react-native';

const initialRegion = {
  latitude: -27.4295945,
  longitude: -48.3985586,
  latitudeDelta: 40,
  longitudeDelta: 40
}

const App = () => {
const [region, setRegion] = useState(initialRegion)

  return (
    <View style={styles.container}>
      <MapView provider={PROVIDER_GOOGLE}
      region={region}
      style={styles.map}
      initialRegion={initialRegion}>

        <Marker
        coordinate={
          {latitude: initialRegion.latitude, longitude: initialRegion.longitude}
        }></Marker>
      </MapView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    height: 400,
    width: 400,
    justifyContent: 'flex-end',
    alignItems: 'center'
  },
  map: {
    ...StyleSheet.absoluteFillObject,
  },
});

export default App;
