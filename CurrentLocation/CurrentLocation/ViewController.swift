//
//  ViewController.swift
//  CurrentLocation
//
//  Created by Chunsu Kim on 20/08/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    private let locationManager = CLLocationManager()
    private let currentLocationLabel = UILabel()
    private var savingCurrentLocation: String = "" {
        didSet {
            currentLocationLabel.text = savingCurrentLocation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        createSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                updateCurrentLocation()
                break
            case .denied, .restricted:
                show(message: "위치 서비스 사용 불가")
            @unknown default:
                break
            }
        } else {
            show(message: "위치 서비스 사용 불가")
        }
        
        showCurrentLocation()
    }
    
    private func createSubView() {
        currentLocationLabel.text = ""
        currentLocationLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        view.addSubview(currentLocationLabel)
        
        currentLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        currentLocationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        currentLocationLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        currentLocationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func showCurrentLocation() {
        if savingCurrentLocation == "" {
            currentLocationLabel.text = "위치 서비스 사용 불가"
        } else {
            currentLocationLabel.text = savingCurrentLocation
        }
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func updateCurrentLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse,
            CLLocationManager.locationServicesEnabled() else { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myLocation = locations.first {
            
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(myLocation) { (placemarks, error) in
                if let place = placemarks?.first {
                    if let locality = place.locality, let subLocality = place.subLocality {
                        self.savingCurrentLocation = "\(locality) \(subLocality)"
                        print(self.savingCurrentLocation)
                    } else {
                        self.savingCurrentLocation = place.name ?? ""
                    }
                }
            }
        }
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        show(message: error.localizedDescription)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            updateCurrentLocation()
        default:
            break
        }
    }
}

// MARK: - AlertController
extension UIViewController {
    func show(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}
