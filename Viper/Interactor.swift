import Foundation

class Interactor: LocationCallback{
    
    var presenter:Presenter?
    let request:Request = Request()
    let locationFetcher = LocationFetcher()
    let cache = Cache.sharedInstance
    
    init() {}
    
    func refresh() {
        locationFetcher.getLocation(callback: self)
    }
    
    func onLocationFetched(latitude:String, longitude: String) {
        if let it = cache.city {
            requestWeather(city: it)
            return
        }
        
        request.getCity(latitude:latitude, longitude: longitude) {geolookup, error in
            if let it = geolookup {
                print(it)
                self.cache.city = CityMapper().map(input: it)
                self.requestWeather(city: self.cache.city!)
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestWeather(city: City){
        self.presenter?.onCity(city.city)
        self.requestConditions(country: city.countryCode, city: city.city)
        self.requestAstronomy(country: city.countryCode, city: city.city)
        self.requestForecast(country: city.countryCode, city: city.city)
    }
    
    private func requestConditions(country: String, city: String) {
        if let it = cache.weather {
            self.presenter?.onConditions(it)
            return
        }
        
        request.getConditions(country: country, city: city) {conditions, error in
            if let it = conditions {
                print(it)
                self.cache.weather = ConditionsMapper().map(input: it)
                self.presenter?.onConditions(self.cache.weather!)
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestAstronomy(country: String, city: String) {
        if let it = cache.astronomy {
            self.presenter?.onAstronomy(it)
            return
        }
        
        request.getAstronomy(country: country, city: city) {astronomy, error in
            if let it = astronomy {
                print(it)
                self.cache.astronomy = AstronomyMapper().map(input: it)
                self.presenter?.onAstronomy(self.cache.astronomy!)
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestForecast(country: String, city: String) {
        if let it = cache.forecast {
            self.presenter?.onForecast(it)
            return
        }
        
        request.getForecast(country: country, city: city) {forecast, error in
            if let it = forecast {
                print(it)
                self.cache.forecast = ForecastMapper().map(input: it)
                self.presenter?.onForecast(self.cache.forecast!)
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
}

