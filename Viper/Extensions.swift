import Foundation

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    var intValue: Int {
        return Int((self as NSString).intValue)
    }
    
    var doubleValue: Double {
        return Double((self as NSString).doubleValue)
    }
}
