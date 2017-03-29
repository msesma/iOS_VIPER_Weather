//
//  Interactor.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

import Foundation

class Interactor {
    
    var presenter:Presenter?
    let dataBase:DataBase?
    
    init() {
        dataBase = DataBase()
    }
    
    func addNewPersonWithData(_ name:String, surname:String) {
        if (name.characters.count > 0 && surname.characters.count > 0) {
            let persona = Persona()
            persona.nombre = name
            persona.apellido = surname
            
            if (dataBase?.personas) != nil {
                dataBase?.personas?.append(persona)
            }else{
                dataBase?.personas = [Persona]()
                dataBase?.personas?.append(persona)
            }
            
            updateList()
        }
    }
    
    func updateList() {
        var arrayPersonas = [String]()
        for persona in dataBase!.personas! {
            
            arrayPersonas.append(persona.nombre! + " " + persona.apellido!)
        }
        
        presenter?.updateObjects(arrayPersonas)
    }
}

