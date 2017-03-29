//
//  Conditions.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

import Foundation
import ObjectMapper

class ConditionsData: Mappable {
    var currenObservation: CurrentObservation?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        currenObservation      <- map["current_observation"]
    }
}

class CurrentObservation: Mappable {
    var precip1hrMetric: String?
    var iconUrl: String?
    var iconName: String?
    var tempC: Float?
    var feelsLikeC: Float?
    var condition: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        precip1hrMetric        <- map["current_observation"]
        iconUrl                <- map["icon_url"]
        iconName               <- map["icon"]
        tempC                  <- map["temp_c"]
        feelsLikeC             <- map["feelslike_c"]
        condition              <- map["weather"]
    }
}
