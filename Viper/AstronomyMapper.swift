
import Foundation

class AstronomyMapper : Mapper{
    func map(input: Astronomy) -> DomAstronomy {
        var riseDate = DateComponents()
        riseDate.hour = input.moonPhase?.sunrise?.hour?.intValue
        riseDate.minute = input.moonPhase?.sunrise?.minute?.intValue
        var setDate = DateComponents()
        setDate.hour = input.moonPhase?.sunset?.hour?.intValue
        setDate.minute = input.moonPhase?.sunset?.minute?.intValue
        
        
        return  DomAstronomy(
            ageOfMoon: input.moonPhase?.ageOfMoon?.intValue ?? 0,
            sunrise: Calendar(identifier: .gregorian).date(from: riseDate),
            sunset: Calendar(identifier: .gregorian).date(from: setDate)
        )
    }
}
