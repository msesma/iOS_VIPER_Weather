import UIKit

class MainViewController: UIViewController, viewProtocol {
    
    var presenter:Presenter?
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var condition: UITextField!
    
    @IBOutlet weak var temp: UITextField!
    
    @IBOutlet weak var feels: UITextField!
    
    @IBOutlet weak var astronomy: UITextField!
    
    
    func showConditions(_ conditions: DomWeather) {
        condition.text = conditions.condition
        temp.text = "\(conditions.temp) ºC"
        feels.text = "Feels like: \(conditions.feelsLike)ºC"
    }
    
    func showAstronomy(_ astronomy: DomAstronomy) {}

    func showError(_ error: String) {}
}
