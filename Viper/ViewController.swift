import UIKit

class ViewController: UIViewController {
    
    var forecast: DomForecast?
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var conditions: UILabel!

    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var feelsLike: UILabel!
    
    @IBOutlet weak var rain: UILabel!
    
    @IBOutlet weak var humidity: UILabel!
    
    @IBOutlet weak var snow: UILabel!
    
    @IBOutlet weak var wind: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        
        if (forecast == nil) {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        title = dateFormatter.string(from: forecast!.time!)
        
        let url:NSURL? = NSURL(string: forecast!.iconUrl)
        let data:NSData? = NSData.init(contentsOf : url! as URL)
        icon.image = UIImage(data: data! as Data)

        conditions.text = forecast!.condition
        temp.text = "\(forecast!.temp)ºC"
        feelsLike.text = "Feels like: \(forecast!.feelslike) ºC"
        rain.text = "Rain probability: \(forecast!.rainProbability)%, \(forecast!.rainQuantity)mm"
        snow.text = "\(forecast!.snow)mm"
        wind.text = "\(forecast!.windSpeed) km/h"
        humidity.text = "\(forecast!.humidity ?? 0)%"
    }
    
    func setNavigationButton(){
        let backButton = UIBarButtonItem(title: "< Home", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
    }
    
    func goBack(sender:UIBarButtonItem){
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
}
