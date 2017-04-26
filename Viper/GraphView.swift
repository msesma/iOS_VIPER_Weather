import Foundation
import UIKit

class GraphView: UIView {
    
    let darkYellow = UIColor.uicolorFromHex(0x9B870C, alpha: 1)
    let transparentBlue = UIColor.uicolorFromHex(0x0000FF, alpha: 0.5)
    private var temps: [CGFloat] = [CGFloat]()
    private var rainsProbablility: [CGFloat] = [CGFloat]()
    
    var astronomy: DomAstronomy?
    var forecast: [DomForecast]?

    public override func draw(_ frame: CGRect) {
        drawForecast()
    }
    
    private func drawForecast(){
        if forecast == nil || astronomy == nil {return}
        
        temps.removeAll()
        rainsProbablility.removeAll()
        
        for item in forecast! {
            temps.append(CGFloat(item.temp))
            rainsProbablility.append(CGFloat(item.rainProbability))
        }
        
        drawTemp()
        drawRain()
    }
    
    private func drawTemp(){
        let min: CGFloat = temps.min() ?? 0
        let max: CGFloat = temps.max() ?? 0
        let hours = temps.count
        let width = CGFloat(frame.size.width)
        let height = CGFloat(frame.size.height)
        let degree = height / (max - min)
        let step = width / CGFloat(hours)
        var xpos:CGFloat = 0
        
        let sunriseH = Calendar.current.component(.hour, from: astronomy!.sunrise!)
        let sunriseM = Calendar.current.component(.minute, from: astronomy!.sunrise!)
        let sunsetH = Calendar.current.component(.hour, from: astronomy!.sunset!)
        let sunsetM = Calendar.current.component(.minute, from: astronomy!.sunset!)
        let nowH = Calendar.current.component(.hour, from: Date())
        
        for i in 0..<hours {
            temps[i] -= min
            var hour = (i + nowH)
            if hour > 24 {hour %= 24}
            
            if hour == sunriseH || hour == sunsetH {
                let minute = hour == sunriseH ? sunriseM : sunsetM
                let isNight: Bool = hour < sunriseH || hour == sunriseH && minute < sunriseM || hour > sunsetH || hour == sunsetH && minute >= sunsetM
                let x = step * (60 - CGFloat(minute)) / 60
                
                var color = getDaylightColor(night: isNight)
                var rect = CGRect(x: xpos, y: height - degree * temps[i], width: x, height: height)
                var bpath = UIBezierPath(rect: rect)
                color.set()
                bpath.fill()
                
                color = getDaylightColor(night: isNight)
                rect = CGRect(x: xpos + x, y: height - degree * temps[i], width: trunc(step + 1 - x), height: height)
                bpath = UIBezierPath(rect: rect)
                color.set()
                bpath.fill()
            } else {
                let isNight: Bool = hour < sunriseH || hour > sunsetH
                let color = getDaylightColor(night: isNight)
                let rect = CGRect(x: xpos, y: height - degree * temps[i], width: trunc(step + 1), height: height)
                let bpath:UIBezierPath = UIBezierPath(rect: rect)
                color.set()
                bpath.fill()
            }
            
            if (hour % 6 == 0) {
                let aPath = UIBezierPath()
                aPath.move(to: CGPoint(x:xpos, y:0))
                aPath.addLine(to: CGPoint(x:xpos, y:height))
                aPath.close()
                UIColor.darkGray.set()
                aPath.stroke()
                drawText(text: String(hour), rect: CGRect(x: xpos - 20, y: height - 24, width: 20, height: 20))
            }

            
            xpos += step
        }
        drawText(text: "\(max)º", rect: CGRect(x: 0, y: 0, width: 30, height: 20))
        drawText(text: "\(min)º", rect: CGRect(x: 0, y:height - 15, width: 30, height: 20))
        backgroundColor = UIColor.lightGray
    }
    
    private func drawRain(){
        let hours = temps.count
        let width = CGFloat(frame.size.width)
        let height = CGFloat(frame.size.height)
        let degree = height / 100
        let step = width / CGFloat(hours)
        var xpos:CGFloat = 0

        transparentBlue.set()
        for i in 0..<hours {
            let rect = CGRect(x: xpos, y: height - degree * rainsProbablility[i], width: trunc(step + 1), height: height)
            let bpath:UIBezierPath = UIBezierPath(rect: rect)
            bpath.fill()
            xpos += trunc(step + 1)
        }
    }
    
    private func getDaylightColor(night: Bool) -> UIColor {
        return night ? darkYellow : UIColor.yellow
    }
    
    private func drawText(text: String, rect: CGRect) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right
            let attrs = [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0), NSParagraphStyleAttributeName: paragraphStyle]
            text.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
    }
    
}
