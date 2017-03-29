//
//  InputOutput.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

import Foundation

protocol InteractorProtocolInput {
    
    func addNewPersonWithData(_ nombre:String, apellido:String)
}

protocol InteractorProtocolOutput {
    
    func updateObjects(_ objects:[String])
}
