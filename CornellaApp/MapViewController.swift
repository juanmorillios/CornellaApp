//
//  MapViewController.swift
//  CornellaApp
//
//  Created by Juan Morillo on 21/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet var mapView: MKMapView!
  var place : Place!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.mapView.showsUserLocation = true
    self.mapView.showsScale = true
    self.mapView.showsCompass = true
    mapView.delegate = self
    
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(place.location) { (placeMarks, error) in
      if error == nil {
        for placeMarks in placeMarks! {
          let anotation = MKPointAnnotation()
          anotation.title = self.place.name
          anotation.subtitle = self.place.type
          anotation.coordinate = (placeMarks.location?.coordinate)!
          self.mapView.showAnnotations([anotation], animated: true)
          self.mapView.selectAnnotation(anotation, animated: true)
        }
      } else {
        print("Ha habido un error: \(String(describing: error?.localizedDescription))")
      }
    }
    print("El mapa debe mostrar" + place.name)
  }
}

extension MapViewController : MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "MyPin"
    if annotation .isKind(of: MKUserLocation.self) {
      return nil
    }
    var annotationView : MKPinAnnotationView? = self.mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
    
    if annotationView == nil {
      annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      annotationView?.canShowCallout = true
    }
  
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
    imageView.image = self.place.image
    annotationView?.leftCalloutAccessoryView = imageView
    annotationView?.pinTintColor = UIColor.orange
    return annotationView
  }
}
