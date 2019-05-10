//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit


final class Annotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    
    }
}


final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  private let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.delegate = self
    checkAuthorizationStatus()
    
    mapView.showsUserLocation = true
    mapView.mapType = .standard
    mapView.showsCompass = true // 방향계 표시
  }
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
//            locationManager.requestAlwaysAuthorization()
        case .restricted, .denied:
            // Disable location features
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdatingLocation()
//            locationManager.requestAlwaysAuthorization()
//            print("authorized")
//            break
        @unknown default: break
        }
    }
    
    func startUpdatingLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse,
        CLLocationManager.locationServicesEnabled()
            else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0
        locationManager.startUpdatingLocation()
        
    }
  
  //
  @IBAction private func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction private func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}

extension MyLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print( " ------- [ status ] ------- " )
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorized")
        default:
            print("Unauthorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let current = locations.last!
        
        if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
            let coordinate = current.coordinate
        
            // span 단위는 1도
            // 경도(longitude) 1도는 약 111 킬로미터,
            // 위도(latitude) 1도는 위도에 따라 변함: 적도 (약 111km) ~ 극지방 (0km)
            let span = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        
            addAnnotation(location: current)
        }
    }
    
    func addAnnotation(location: CLLocation) {
        let annotation = Annotation(title: "MyLocation", coordinate: location.coordinate)
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            // Location updates are no authorized.
            return
        }
        // Notify the user of any errors.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("trueHeading :", newHeading.trueHeading)
        print("magneticHeading :", newHeading.magneticHeading)
        print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
    }
}
