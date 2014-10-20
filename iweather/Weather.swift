import Foundation
// Oppgave 2a
class Weather {
    var weatherType: String?
    var date: NSDate?
    var tempMin: Double?
    var tempMax: Double?
    
    init(weatherType: String?, date: NSDate?, tempMin: Double?, tempMax: Double?) {
        self.weatherType = weatherType
        self.date = date
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
    
    func description() -> String {
        return "weatherType: \(weatherType), date: \(date), tempMin: \(tempMin), tempMax: \(tempMax)"
    }
}