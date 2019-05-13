//
//  ViewController.swift
//  MapKitAssignment
//
//  Created by Chunsu Kim on 11/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController {
    
    
    let textFiled = UITextField()
    let removeButton = UIButton(type: .system)
    private var mapView = MKMapView()
    private var exPoint: [CLLocationCoordinate2D] = []
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
        checkAuthorizationStatus()
        
    }
    
    func configure() {
        view.backgroundColor = .white
        
        textFiled.font = UIFont.systemFont(ofSize: 20)
        textFiled.textAlignment = .left
        textFiled.backgroundColor = .white
        textFiled.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        textFiled.borderStyle = .roundedRect
        textFiled.placeholder = "Please, typing Address"
        textFiled.keyboardAppearance = UIKeyboardAppearance.dark
        textFiled.clearButtonMode = UITextField.ViewMode.always
        textFiled.enablesReturnKeyAutomatically = true
        textFiled.addTarget(self, action: #selector(textFieldShouldReturn(_:)), for: .editingDidEndOnExit)
        
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        removeButton.addTarget(self, action: #selector(removeOverlays(_:)), for: .touchUpInside)
        
        mapView.mapType = .standard
        mapView.showsCompass = true
        mapView.delegate = self
        
        view.addSubview(textFiled)
        mapView.addSubview(removeButton)
        view.addSubview(mapView)
        
    }
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func autoLayout() {
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        textFiled.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textFiled.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        textFiled.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        textFiled.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textFiled.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: textFiled.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.topAnchor.constraint(equalTo: textFiled.bottomAnchor).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        removeButton.centerXAnchor.constraint(equalTo: textFiled.centerXAnchor).isActive = true
    }
    
    @objc func textFieldShouldReturn(_ sender: UITextField) {
        
        let geocoder = CLGeocoder()
        let location = textFiled.text!
        
        geocoder.geocodeAddressString(location, completionHandler: { (placeMark, error) in
            guard let placeMark = placeMark?.first else { return }
            
            if error != nil {
                return print(error!.localizedDescription)
            }
            
            let placePoint = placeMark.location?.coordinate
            
            self.setRegion(coordinate: placePoint!)
        })
        
        sender.resignFirstResponder()
    }
    
    @objc func removeOverlays(_ sender: UIButton) {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        exPoint = []
    }
    
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        exPoint.append(coordinate)
        addAnnotation(coordinate)
        print(exPoint)
    }
    
    func addAnnotation(_ sender: CLLocationCoordinate2D) {
        
        let placePoint = MKPointAnnotation()
        placePoint.title = "Marking place \(exPoint.count)"
        placePoint.coordinate = sender
        mapView.addAnnotation(placePoint)
        
        let center = sender
        
        var point1 = center; point1.longitude -= 0.0015; point1.latitude += 0.0015
        var point2 = center; point2.longitude += 0.0015; point2.latitude += 0.0015
        var point3 = center; point3.longitude += 0.0015; point3.latitude -= 0.0015
        var point4 = center; point4.longitude -= 0.0015; point4.latitude -= 0.0015
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        
        let square = MKPolyline(coordinates: points, count: points.count)
        
        let polyline = MKPolyline(coordinates: exPoint, count: exPoint.count)
        
        
        mapView.addOverlay(square)
        mapView.addOverlay(polyline)
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
