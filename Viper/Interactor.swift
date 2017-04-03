import Foundation

class Interactor {
    
    var presenter:Presenter?
    let request:Request = Request()
    
    init() {}
    
    func refresh() {
        requestConditions()
        requestAstronomy()
        requestForecast()
    }
    
    private func requestConditions() {
        request.getConditions(country: "ES", city: "Humera") {conditions, error in
            if let it = conditions {
                print(it)
                self.presenter?.onConditions(ConditionsMapper().map(input: it))
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestAstronomy() {
        request.getAstronomy(country: "ES", city: "Humera") {astronomy, error in
            if let it = astronomy {
                print(it)
                self.presenter?.onAstronomy(AstronomyMapper().map(input: it))
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
    
    private func requestForecast() {
        request.getForecast(country: "ES", city: "Humera") {forecast, error in
            if let it = forecast {
                print(it)
                self.presenter?.onForecast(ForecastMapper().map(input: it))
            }
            if let it = error {
                print(it.localizedDescription)
                self.presenter?.onError(it)
            }
        }
    }
}

