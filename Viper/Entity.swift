import Foundation

struct City{
    var city: String = ""
    var countryCode: String = ""
}

class DomWeather{
    let precip1hrMetric, temp, feelsLike: Float
    let condition, iconUrl, iconName: String
    
    required init(
        precip1hrMetric: Float,
        iconUrl: String,
        iconName: String ,
        temp: Float,
        feelsLike: Float,
        condition: String
        ) {
        self.precip1hrMetric = precip1hrMetric
        self.iconUrl = iconUrl
        self.iconName = iconName
        self.temp = temp
        self.feelsLike = feelsLike
        self.condition = condition
    }
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




