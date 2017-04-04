import Foundation
import ObjectMapper

class GeoLookUp: Mappable {
    var location: Location?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        location        <- map["location"]
    }
}

class Location: Mappable {
    var city: String?
    var country: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        city            <- map["city"]
        country         <- map["country_iso3166"]
    }
}
