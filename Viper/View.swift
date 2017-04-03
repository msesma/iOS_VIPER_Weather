import Foundation

protocol viewProtocol {
    
    func showConditions(_ conditions: DomWeather)
    
    func showAstronomy(_ astronomy: DomAstronomy)
    
    func showError(_ error: String)
}

