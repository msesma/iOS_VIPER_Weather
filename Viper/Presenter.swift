import Foundation

import UIKit

class Presenter : viewOutProtocol {
    var view:MainViewController?
    var interactor:Interactor?
    var routing:Routing?
    
    init() {}
    
    func onRefresh(){
        interactor?.refresh()
    }
    
    func onConditions(_ conditions: DomWeather) {
        view?.showConditions(conditions)
    }
   
    func onAstronomy(_ astronomy: DomAstronomy) {
        view?.showAstronomy(astronomy)
    }
    
    func onForecast(_ forecast: [DomForecast]) {
        view?.showForecast(forecast)
    }
    
    func onCity(_ city: String) {
        view?.showCity(city)
    }
    
    func onError(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
    
    func onClick(forecastRow: DomForecast) {
        routing?.openDetailView(forecast: forecastRow)
    }

}
