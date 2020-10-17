//
//  MapViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import UIKit
import MapKit

class MapViewController: ViewController {
    
    private var mapView: MKMapView!
    
    var locationManager:CLLocationManager!
    var didGetUserLocation: Bool = false
    
    override func prepareViews() {
        mapView = .init()
        locationManager = .init()
    }
    
    override func addViewHierarchy() {
        view.addSubview(mapView)
    }
    
    override func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
    }
    
    override func configureViews() {
        mapView.delegate = self
        determineCurrentLocation()
    }
    
    
    func determineCurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        guard let coordinate = locationManager.location?.coordinate else { return }
        setUserLocation(for: coordinate)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
    }
    
    private func setUserLocation(for coordinate: CLLocationCoordinate2D) {
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
        
        let kAnnotation: MKPointAnnotation = MKPointAnnotation()
        kAnnotation.coordinate = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
        kAnnotation.title = "Minha Localização"
        mapView.addAnnotation(kAnnotation)
        didGetUserLocation = true
    }
    
    private func drawRoute(from sourceLocation: CLLocationCoordinate2D, to destinationLocation: CLLocationCoordinate2D) {
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
    func askDrawRoute(for annotation: Annotation) {
        let alert = UIAlertController(title: "Deseja traçar a rota para este local?", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Sim", style: .default) { _ in
            guard let coordinate = self.locationManager.location?.coordinate else { return }
            self.drawRoute(from: coordinate, to: annotation.coordinate)
        }
        alert.addAction(action)
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let Identifier = "Pin"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)
       
        if annotation is Annotation {
            let pinImage = UIImage(named: "pin")
            annotationView.image = pinImage
            annotationView.canShowCallout = true
            annotationView.calloutOffset = CGPoint(x: -5, y: 5)
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            return annotationView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 3
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let pinSelected = view.annotation as? Annotation {
            askDrawRoute(for: pinSelected)
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate, !didGetUserLocation else { return }
        setUserLocation(for: coordinate)
    }
    
}
