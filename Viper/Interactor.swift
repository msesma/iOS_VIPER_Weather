import Foundation

class Interactor {
    
    var presenter:Presenter?
    let request:Request = Request()
    
    init() {
         request.getConditions(country: "ES", city: "Humera") {conditions, error in
            if let it = conditions {
                print(it)
                let currentWeather = ConditionsMapper().map(input: it)
                print(currentWeather.condition)
            }
            if let it = error {
                print(it.localizedDescription)
            }
        }
    }
}

