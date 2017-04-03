import Foundation

import UIKit

class Presenter {
    var view:MainViewController?
    var interactor:Interactor?
    var routing:Routing?
    
    init() {}
    
    func onViewReady() {
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
    
    func onError(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
}
