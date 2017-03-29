//
//  Request.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

import Foundation

import Alamofire

class Request {
    
    func getData(){
        Alamofire.request("https://jsonplaceholder.typicode.com/todos/1").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
//    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
//    guard let url = URL(string: todoEndpoint) else {
//    print("Error: cannot create URL")
//    return
//    }
//    let urlRequest = URLRequest(url: url)
    
}
