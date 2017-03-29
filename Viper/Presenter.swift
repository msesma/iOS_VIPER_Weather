//
//  Presenter.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

// https://www.adictosaltrabajo.com/tutoriales/viper/


import Foundation

import UIKit

class Presenter {
    var view:TableViewController?
    var interactor:Interactor?
    var routing:Routing?
    
    init() {
        
    }
    
    func addNewObjectWithData(name:String, surname:String) {
        interactor?.addNewPersonWithData(name, surname: surname)
    }
    
    func updateObjects(_ objects: [String]) {
        view?.setListWithObjects(objects)
    }
    
    func addNewObject() {
        routing?.openAddView()
    }
}
