
import Foundation

class CityMapper : Mapper{
    func map(input: GeoLookUp) -> City {
          return  City(
            city: input.location?.city ?? "",
            countryCode: input.location?.country ?? ""
        )
    }
}
