import Foundation
import UIKit

class GraphView: UIView {
    
    let dateFormatter = DateFormatter()
    private var temps: [CGFloat] = [CGFloat]()
    private var feelLike: [CGFloat] = [CGFloat]()
    private var rainsQuantity: [CGFloat] = [CGFloat]()
    private var rainsProbability: [CGFloat] = [CGFloat]()
    
    var forecast: [DomForecast]?

    public override func draw(_ frame: CGRect) {
        drawForecast()
    }
    
    private func drawForecast(){
        if forecast == nil {return}
        dateFormatter.dateFormat = "HH"
        
//        cell.hourField.text = dateFormatter.string(from: (forecastItem?.time!)!)
        
        temps.removeAll()
        feelLike.removeAll()
        rainsQuantity.removeAll()
        rainsProbability.removeAll()
        
        for item in forecast! {
            temps.append(CGFloat(item.temp))
            feelLike.append(CGFloat(item.feelslike))
            rainsQuantity.append(CGFloat(item.rainQuantity))
            rainsProbability.append(CGFloat(item.rainProbability))
        }
        
        drawTemp()
//        drawRain(canvas)
    }
    
    private func drawTemp(){
        let min: CGFloat = temps.min()!
        let max: CGFloat = temps.max()!
        let hours = temps.count
        let width = CGFloat(frame.size.width)
        let height = CGFloat(frame.size.height)
        let degree = height / (max - min)
        let step = width / CGFloat(hours)
        var xpos:CGFloat = 0
        
        backgroundColor = UIColor.lightGray

        for i in 0..<hours {
            temps[i] -= min
            feelLike[i] -= min
            
            let color:UIColor = UIColor.yellow
            
            let rect = CGRect(x: xpos, y: height - degree * temps[i], width: trunc(step + 1), height: height)
            let bpath:UIBezierPath = UIBezierPath(rect: rect)
            
            color.set()
            bpath.fill()

            xpos += step
        }
        
        backgroundColor = UIColor.lightGray

        
    }
    
}
