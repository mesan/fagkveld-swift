import Foundation
// Oppgave 2a
class Weather {
    var weatherType: String?
    var date: NSDate?
    var tempMin: Double?
    var tempMax: Double?
    var iconName: String?
    
    init(weatherType: String?, date: NSDate?, tempMin: Double?, tempMax: Double?, iconName: String?) {
        self.weatherType = weatherType
        self.date = date
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.iconName = iconName
    }
    
    func description() -> String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return "\(dateFormatter.stringFromDate(date!)) - \(weatherType!) - \(tempMax!) C / \(tempMin!) C"

    }
}