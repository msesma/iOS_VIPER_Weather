import UIKit

class MainViewController: UIViewController, viewProtocol {
    
    var presenter:Presenter?
    var listVC: ForecastTableViewController?
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var condition: UITextField!
    
    @IBOutlet weak var temp: UITextField!
    
    @IBOutlet weak var feels: UITextField!
    
    @IBOutlet weak var daylight: UITextField!
    
    @IBOutlet weak var icon: UIImageView!
    
    func showConditions(_ conditions: DomWeather) {
        condition.text = conditions.condition
        temp.text = "\(conditions.temp) ºC"
        feels.text = "Feels like: \(conditions.feelsLike)ºC"
        
        let url:NSURL? = NSURL(string: conditions.iconUrl)
        let data:NSData? = NSData.init(contentsOf : url! as URL)
        icon.image = UIImage(data: data! as Data)
    }
    
    func showAstronomy(_ astronomy: DomAstronomy) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let sunrise = dateFormatter.string(from: astronomy.sunrise!)
        let sunset = dateFormatter.string(from: astronomy.sunset!)
        
        daylight.text = "Sunrise: \(sunrise), Sunset: \(sunset)"
    }
    
    func showForecast(_ forecast: [DomForecast]) {
        listVC?.showForecast(forecast)
    }
    
    func showCity(_ city: String) {
        self.city.text = city
    }
    
    func showError(_ error: String) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listSegue" {
            listVC = segue.destination as? ForecastTableViewController
        }
    }
}
