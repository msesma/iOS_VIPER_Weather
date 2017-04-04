import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    var callback: LocationCallback?
    
    func getLocation(callback: LocationCallback) {
        self.locationManager.requestAlwaysAuthorization()
        self .callback = callback
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        print("locations = \(location.coordinate.latitude) \(location.coordinate.longitude)")
        callback?.onLocationFetched(latitude: location.coordinate.latitude.toString,
                                    longitude: location.coordinate.longitude.toString)
        locationManager.stopUpdatingLocation()
    }
}

protocol LocationCallback {
    func onLocationFetched(latitude:String, longitude: String)
}
