import Foundation

struct City{
    var city: String = ""
    var countryCode: String = ""
}

struct DomWeather{
    var precip1hrMetric: Float = 0
    var iconUrl: String = ""
    var iconName: String = ""
    var temp: Float = 0
    var feelsLike: Float = 0
    var condition: String = ""
}

struct DomAstronomy{
    var ageOfMoon: Int = 0
    var sunrise: Date?
    var sunset: Date?
}

struct DomForecast{
    var time: Date?
    var temp: Float = 0
    var feelslike: Float = 0
    var windSpeed: Float = 0
    var rainQuantity: Float = 0
    var rainProbability: Float = 0
    var snow: Float = 0
    var condition: String = ""
    var iconUrl: String = ""
    var humidity: Float? = 0
}




