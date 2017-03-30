import Foundation
import Alamofire
import AlamofireObjectMapper

class Request {
    
    let WUKEY: String = "93d0c442f87c0b10"
    var URL: String
    
    init(){
        URL = "http://api.wunderground.com/api/\(WUKEY)/"
    }
    
    func getConditions(country: String, city:String, completionHandler: @escaping (ConditionsData?, Error?) -> ()) {
        let conditionsUrl = URL + "conditions/q/\(country)/\(city).json"
        
        Alamofire.request(conditionsUrl).responseObject { (response: DataResponse<ConditionsData>) in
            print(response.response ?? "No http response")
            switch response.result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func getAstronomy(country: String, city:String, completionHandler: @escaping (Astronomy?, Error?) -> ()) {
        let conditionsUrl = URL + "conditions/q/\(country)/\(city).json"
        
        Alamofire.request(conditionsUrl).responseObject { (response: DataResponse<Astronomy>) in
            print(response.response ?? "No http response")
            switch response.result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }

    func getForecast(country: String, city:String, completionHandler: @escaping ([Forecast]?, Error?) -> ()) {
        let conditionsUrl = URL + "conditions/q/\(country)/\(city).json"
        
        Alamofire.request(conditionsUrl).responseArray { (response: DataResponse<[Forecast]>) in
            print(response.response ?? "No http response")
            switch response.result {
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }

}
