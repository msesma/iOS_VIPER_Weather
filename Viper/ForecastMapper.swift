
import Foundation

class ForecastMapper : Mapper{
    func map(input: Forecast) -> [DomForecast] {
        var forecast = [DomForecast]()
        let hourlyForecast = input.hourlyForecast
        
        for item in hourlyForecast! {
            forecast.append(DomForecast(
                time: Date(timeIntervalSince1970: item.fctTime?.epoch?.doubleValue ?? 0),
                temp: item.temp?.metric?.floatValue ?? 0,
                feelslike: item.feelslike?.metric?.floatValue ?? 0,
                windSpeed: item.wspd?.metric?.floatValue ?? 0,
                rainQuantity: item.qpf?.metric?.floatValue ?? 0,
                rainProbability: item.pop?.floatValue ?? 0,
                snow: item.snow?.metric?.floatValue ?? 0,
                condition: item.condition ?? "",
                iconUrl: item.iconUrl ?? "",
                humidity: item.humidity?.floatValue ?? 0
            ))
        }
        return  forecast
    }
}
