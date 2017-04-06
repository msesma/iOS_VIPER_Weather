import Foundation

protocol viewProtocol {
    
    func showConditions(_ conditions: DomWeather)
    
    func showAstronomy(_ astronomy: DomAstronomy)

    func showForecast(_ forecast: [DomForecast])
    
    func showCity(_ city: String)
    
    func showError(_ error: String)
}

protocol viewOutProtocol {
    func onRefresh()
}

