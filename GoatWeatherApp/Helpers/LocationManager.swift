//
//  LocationManager.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import CoreLocation

class LocationManager: NSObject {
    
    static let shared = LocationManager()
    private var locationManager = CLLocationManager()
    private var completion: ((CLLocationCoordinate2D) -> Void)?
    
    var isLocationEnabled: Bool {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            return true
        default:
            return false
        }
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation(completion: ((CLLocationCoordinate2D) -> Void)?) {
        self.completion = completion
        guard isLocationEnabled == false else {
            locationManager.startUpdatingLocation()
            return
        }
        
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        guard let coordinate = locations.first?.coordinate else { return }
        completion?(coordinate)
        completion = nil
    }
}
