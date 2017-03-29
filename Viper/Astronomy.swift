//
//  Astronomy.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

import Foundation
import ObjectMapper

class Astronomy: Mappable {
    var moonPhase: MoonPhase?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        moonPhase           <- map["moon_phase"]
    }
}

class MoonPhase: Mappable {
    var ageOfMoon: String?
    var sunrise: Sunrise?
    var sunset: Sunset?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        ageOfMoon           <- map["ageOfMoon"]
        sunrise             <- map["sunrise"]
        sunset              <- map["sunset"]
    }
}

class Sunrise: Mappable {
    var hour: String?
    var minute: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        hour                <- map["hour"]
        minute              <- map["minute"]
    }
}

class Sunset: Mappable {
    var hour: String?
    var minute: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        hour                <- map["hour"]
        minute              <- map["minute"]
    }
}
