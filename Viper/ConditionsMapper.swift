
import Foundation

class ConditionsMapper : Mapper{
    func map(input: ConditionsData) -> DomWeather {
         return  DomWeather(
            precip1hrMetric : input.currenObservation?.precip1hrMetric?.floatValue ?? 0,
            iconUrl :input.currenObservation?.iconUrl ?? "",
            iconName : input.currenObservation?.iconName ?? "",
            temp : input.currenObservation?.tempC ?? 0,
            feelsLike : input.currenObservation?.feelsLikeC ?? 0,
            condition : input.currenObservation?.condition ?? ""
        )
    }
}
