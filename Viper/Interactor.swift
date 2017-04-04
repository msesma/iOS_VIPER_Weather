import Foundation

class Interactor: LocationCallback{
    
    var presenter:Presenter?
    let request:Request = Request()
    let locationFetcher = LocationFetcher()
    
    init() {}
    
    func refresh() {
        locationFetcher.getLocation(callback: self)    }
    
    private func requestConditions(country: String, city: String) {
        request.getConditions(country: country, city: city) {conditions, error in
            if let it = conditions {
                print(it)
                self.presenter?.onConditions(ConditionsMapper().map(input: it))
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestAstronomy(country: String, city: String) {
        request.getAstronomy(country: country, city: city) {astronomy, error in
            if let it = astronomy {
                print(it)
                self.presenter?.onAstronomy(AstronomyMapper().map(input: it))
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestForecast(country: String, city: String) {
        request.getForecast(country: country, city: city) {forecast, error in
            if let it = forecast {
                print(it)
                self.presenter?.onForecast(ForecastMapper().map(input: it))
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    func onLocationFetched(latitude:String, longitude: String) {
        request.getCity(latitude:latitude, longitude: longitude) {geolookup, error in
            if let it = geolookup {
                print(it)
                let city = CityMapper().map(input: it)
                self.presenter?.onCity(city.city)
                self.requestConditions(country: city.countryCode, city: city.city)
                self.requestAstronomy(country: city.countryCode, city: city.city)
                self.requestForecast(country: city.countryCode, city: city.city)
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
}

