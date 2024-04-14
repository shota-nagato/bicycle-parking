import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"];

  connect() {
    console.log("スタート")
    console.log(document.getElementById("data").value)
    const data = JSON.parse(document.getElementById("data").value)
    console.log(data)
    mapboxgl.accessToken = this.mapTarget.dataset.mapboxAccessToken
    const features = data.map(item => {
      return {
        'type': 'Feature',
        'properties': {
          'description': item.discription
        },
        'geometry': {
          'type': 'Point',
          'coordinates': [item.longitude, item.latitude]
        }
      }
    })
    const geojson = {
      'type': 'FeatureCollection',
      'features': features
    }

    const map = new mapboxgl.Map({
      container: "map",
      style: this.mapTarget.dataset.mapboxJapanStyle,
      center: [131.607377000107,33.2321189271901],
      zoom: 11,
    })

    map.on('load', () => {
      map.addSource('places', {
        'type': 'geojson',
        'data': geojson
      });
    });

    for (const marker of geojson.features) {
      const el = document.createElement('div');
      el.className = 'marker';
      el.style.backgroundImage = `url(${this.mapTarget.dataset.imagePath})`;
      el.style.width = '30px';
      el.style.height = '30px';
      el.style.backgroundSize = '100%';

      const popup = new mapboxgl.Popup({ offset: 20 })
        .setHTML(marker.properties.description);

      new mapboxgl.Marker(el)
        .setLngLat(marker.geometry.coordinates)
        .setPopup(popup)
        .addTo(map);
    }

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true,
      }),
      'bottom-right'
    );

    map.addControl(
      new mapboxgl.NavigationControl(),
      'bottom-right'
    )
  }
}
