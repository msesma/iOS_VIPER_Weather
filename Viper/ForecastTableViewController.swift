import UIKit

class ForecastTableViewController: UITableViewController {

    var forecast: [DomForecast]?
    
    func showForecast(_ forecast: [DomForecast]) {
        self.forecast = forecast
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ForecastTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ForecastTableViewCell
            else { fatalError("The dequeued cell is not an instance of MealTableViewCell.") }
        let forecastItem = forecast?[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        cell.hourField.text = dateFormatter.string(from: (forecastItem?.time!)!)
        cell.tempField.text = "\(forecastItem?.temp ?? 0)"
        cell.feelsLikeField.text = "ºC Feels like: \(forecastItem?.feelslike ?? 0) ºC"
        cell.windField.text = "\(forecastItem?.windSpeed ?? 0) km/h"
        cell.humidityField.text = "\(forecastItem?.humidity ?? 0)%"
        
        let url:NSURL? = NSURL(string: forecastItem?.iconUrl ?? "")
        let data:NSData? = NSData.init(contentsOf : url! as URL)
        cell.icon.image = UIImage(data: data! as Data)
        
        return cell
    }

}
