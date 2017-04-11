import Foundation

class Cache {
    static let sharedInstance = Cache()
    private init() {}
    
    var time: Double{
        get{ return Date().timeIntervalSince1970 }
    }
    
    var cityTimestamp: Double = 0
    var cityField: City? = nil
    var city: City? {
        get {
            let timedOut = (cityTimestamp < time - 5 * 60)
            print("GET city timed out \(timedOut), previous value = \(String(describing: cityField))")
            return !timedOut ? cityField : nil
        }
        set {
            print("SET city \(String(describing: newValue)), previous value = \(String(describing: cityField))")
            if (newValue != nil && newValue!.city != cityField?.city) {
                astronomy = nil
                weather = nil
                forecast = nil
            }
            cityTimestamp = time
            cityField = newValue
        }
    }

    var weatherTimestamp: Double = 0
    var weatherField: DomWeather? = nil
    var weather: DomWeather? {
        get {
            let timedOut = (weatherTimestamp < time - 5 * 60 * 60)
            print("GET weather timed out \(timedOut), previous value = \(String(describing: weatherField))")
            return !timedOut ? weatherField : nil
        }
        set {
            print("SET weather \(String(describing: newValue)), previous value = \(String(describing: weatherField))")
            weatherTimestamp = time
            weatherField = newValue
        }
    }
    
    var astronomyTimestamp: Double = 0
    var astronomyField: DomAstronomy? = nil
    var astronomy: DomAstronomy? {
        get {
            let timedOut = (astronomyTimestamp < time - 5 * 60 * 60)
            print("GET astronomy timed out \(timedOut), previous value = \(String(describing: astronomyField))")
            return !timedOut ? astronomyField : nil
        }
        set {
            print("SET astronomy \(String(describing: newValue)), previous value = \(String(describing: astronomyField))")
            astronomyTimestamp = time
            astronomyField = newValue
        }
    }

    var forecastTimestamp: Double = 0
    var forecastField: [DomForecast]? = nil
    var forecast: [DomForecast]? {
        get {
            let timedOut = (forecastTimestamp < time - 5 * 60 * 60)
            print("GET forecast timed out \(timedOut)")
            return !timedOut ? forecastField : nil
        }
        set {
            print("SET forecast")
            forecastTimestamp = time
            forecastField = newValue
        }
    }
}
