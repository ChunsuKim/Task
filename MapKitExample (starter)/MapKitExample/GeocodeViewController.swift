//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit
import MapKit


final class GeocodeViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
    let touchPoint = gesture.location(in: gesture.view)
    let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
        if error != nil {
            return print(error!.localizedDescription)
        }
        
        guard let address = placeMark?.first,
            let country = address.country,
            let administrativeArea = address.administrativeArea,
            let locality = address.locality,
            let name = address.name
            
            else { return }
        
//        print(" - \(country) \(administrativeArea) \(locality) \(name)")
        
        let addr = "\(country) \(administrativeArea) \(locality) \(name)"
        geocoder.geocodeAddressString(addr, completionHandler: { (placeMark, error) in
            print(placeMark ?? placeMark as Any)
            
//            if error != nil {
//                return print(error!.localizedDescription)
//            }
//
//            guard let placeMark = placeMark?.first else { return }
//            print(placeMark.region?.identifier ?? placeMark)
        })
        
    }
  }
}
