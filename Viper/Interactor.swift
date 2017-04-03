import Foundation

class Interactor {
    
    var presenter:Presenter?
    let request:Request = Request()
    
    init() {}
    
    func refresh() {
        request.getConditions(country: "ES", city: "Humera") {conditions, error in
            if let it = conditions {
                print(it)
                let currentWeather = ConditionsMapper().map(input: it)
                self.presenter?.onConditions(currentWeather)
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
}

