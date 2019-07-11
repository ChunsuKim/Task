//
//  ViewController.swift
//  GoogleAPIExample
//
//  Created by Chunsu Kim on 10/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {
    
    private var mapView: GMSMapView!
    private var marker = GMSMarker()
    private let locationManager = CLLocationManager()
    private let searchTextField = UITextField()
    private let locationLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureViews()
        checkAuthorizationStatus()
        locationManager.delegate = self
        view.backgroundColor = .white
        loadView()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        let coordinate = CLLocationCoordinate2D()
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        mapView = GMSMapView()
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
        mapView.camera = camera
        
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        view = mapView
        configureViews()
//        view.addSubview(mapView)
        
        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
    }
    
    private func configureViews() {
        
        mapView.addSubview(searchTextField)
        mapView.addSubview(locationLabel)
        
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
        @unknown default: break
        }
    }
    
    private func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse,
        CLLocationManager.locationServicesEnabled()
            else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }
    
    private func configureMapViewConstraints() {
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
//        searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        searchTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}

extension ViewController: CLLocationManagerDelegate, GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        mapView.clear()
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        print("move \(position.target.latitude)")
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(position.target) { (response, error) in
            guard error == nil else {
                return
            }
            
//            if let result = response?.firstResult() {
//                let marker = GMSMarker()
//                self.marker.position = position.target
//                self.marker.title = result.lines?[0]
//                self.marker.snippet = result.lines?[1]
//                self.marker.appearAnimation = .pop
//                self.marker.map = self.mapView
//            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.first
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let camera = GMSCameraPosition.camera(withLatitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude, zoom: 17.0)

        mapView.camera = camera
        mapView.isMyLocationEnabled = true

        let marker = GMSMarker(position: center)
        marker.map = mapView
        marker.title = "Current Location"
    }
}

