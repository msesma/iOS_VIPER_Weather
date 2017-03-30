import Foundation
import ObjectMapper

class Forecast: Mappable {
    var hourlyForecast: HourlyForecast?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        hourlyForecast           <- map["hourly_forecast"]
    }
}

class HourlyForecast: Mappable {
    var fctTime: FctTime?
    var temp: Temp?
    var feelslike: Feelslike?
    var wspd: Wspd?
    var qpf: Qfp?
    var snow: Snow?
    var condition: String?
    var iconUrl: String?
    var humidity: String?
    var pop: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        fctTime                 <- map["FCTTIME"]
        temp                    <- map["temp"]
        feelslike               <- map["feelslike"]
        wspd                    <- map["wspd"]
        qpf                     <- map["qfp"]
        snow                    <- map["snow"]
        condition               <- map["condition"]
        iconUrl                 <- map["icon_url"]
        humidity                <- map["humidity"]
        pop                     <- map["pop"]
    }
}

class FctTime: Mappable {
    var epoch: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        epoch                   <- map["epoch"]
    }
}

class Temp: Mappable {
    var metric: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        metric                  <- map["metric"]
    }
}

class Feelslike: Mappable {
    var metric: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        metric                  <- map["metric"]
    }
}

class Wspd: Mappable {
    var metric: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        metric                  <- map["metric"]
    }
}

class Qfp: Mappable {
    var metric: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        metric                  <- map["metric"]
    }
}

class Snow: Mappable {
    var metric: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        metric                  <- map["metric"]
    }
}

